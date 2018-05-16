//
//  TwitterDataSource.swift
//  Store
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils
import TwitterKit

public struct TwitterDataSource {
    let twitter: TWTRTwitter
    
    public init(twitter: TWTRTwitter) {
        self.twitter = twitter
    }
    
    func request(_ target: TwitterService, completion: @escaping (Result<JsonResult>) -> ()) {
        getApiClient {
            switch $0 {
            case let .success(client):
                self.send(target: target, client: client) {
                    completion($0)
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    private func send(target: TwitterService, client: TWTRAPIClient, completion: @escaping (Result<JsonResult>) -> ()) {

        var clientError : NSError?
        
        var request = client.urlRequest(withMethod: target.method.rawValue,
                                        urlString: target.endpoint,
                                        parameters: target.parameters,
                                        error: &clientError)
        request.timeoutInterval = 15
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            do {
                if let error = connectionError {
                    throw error
                }
                
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                let jsonResult = try JsonResult(any: json)
                
                completion(.success(jsonResult))
            } catch {
                completion(.failure(error.httpError))
            }
        }
    }
    
    public func getApiClient(completion: @escaping (Result<TWTRAPIClient>) -> ()) {
        if twitter.sessionStore.hasLoggedInUsers(),
            let session = twitter.sessionStore.session() {
            completion(.success(TWTRAPIClient(userID: session.userID)))
            return
        }
        
        twitter.logIn { (session, error) in
            guard let userID = session?.userID else { return }
            
            completion(.success(TWTRAPIClient(userID: userID)))
        }
    }
    
}
