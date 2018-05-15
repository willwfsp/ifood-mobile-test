//
//  NaturalLanguageRepository.swift
//  Store
//
//  Created by Willian on 14/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Domain
import Utils

public struct NaturalLanguageRepository: Domain.NaturalLanguageRepository {
    let dataSource: RestDataSource<GoogleService>
    
    public init(dataSource: RestDataSource<GoogleService>) {
        self.dataSource = dataSource
    }
    
    public func analyzeSentiment(text: String, completion: @escaping (Result<Sentence>) -> ()) {
        dataSource.request(.sentiment(text: text)) {
            switch $0 {
            case let .success(jsonResult):
                guard case let .object(json) = jsonResult else {
                    completion(.failure(JsonError.malformed))
                    return
                }
                
                do {
                    let entity = try GoogleSentimentApiEntity(with: json)
                    let sentence = Sentence(text: text, score: entity.documentSentiment?.score)
                    completion(.success(sentence))
                } catch {
                    completion(.failure(error.genericError))
                }

            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
