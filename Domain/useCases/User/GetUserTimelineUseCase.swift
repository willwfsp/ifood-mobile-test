//
//  GetUserTimelineUseCase.swift
//  Domain
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

public extension GetUserTimelineUseCase {
    struct Request {
        let userId: String
        
        public init(userId: String)  {
            self.userId = userId
        }
    }
}

public struct GetUserTimelineUseCase: UseCase {
    public typealias T = [Tweet]
    public typealias R = Request
    
    let userRepository: UserRepository
    let sessionRepository: SessionRepository
    let naturalLanguageRepository: NaturalLanguageRepository
    
    public init(userRepository: UserRepository, sessionRepository: SessionRepository, naturalLanguageRepository: NaturalLanguageRepository) {
        self.userRepository = userRepository
        self.sessionRepository = sessionRepository
        self.naturalLanguageRepository = naturalLanguageRepository
    }
    
    public func execute(request: Request? = nil, completion: @escaping (Result<[Tweet]>) -> ()) {
        guard let userId = request?.userId else {
            completion(.failure(DomainError.missingRequest(onUseCase: "GetUserTimelineUseCase")))
            return
        }
        
        sessionRepository.getSessionUserId {
            switch $0 {
            case .success:
                self.userRepository.timeline(userId: userId) {
                    guard let tweets = $0.data else {
                        completion($0)
                        return
                    }
                    
                    var analyzedTweets = [Tweet]()
                    
                    self.analyzeSentimentIfNeeded(tweets: tweets) {
                        analyzedTweets.append($0)
                        if analyzedTweets.count == tweets.count {
                            completion(.success(analyzedTweets))
                            return
                        }
                    }
                    
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func analyzeSentimentIfNeeded(tweets: [Tweet], completion: @escaping (Tweet) -> ()) {

        tweets.forEach { tweet in
            
            guard let sentence = tweet.sentence, let text = sentence.text else {
                return
            }
            
            self.naturalLanguageRepository.analyzeSentiment(text: text) {
                
                guard let sentence = $0.data else {
                    completion(tweet)
                    return
                }
                
                let analyzedTweet = Tweet(id: tweet.id,
                                          sentence: Sentence(text: sentence.text,
                                                             score: sentence.score),
                                          createdDate: tweet.createdDate)
                
                completion(analyzedTweet)
            }
        }
    }
}

