//
//  GoogleSentimentApiEntity.swift
//  Store
//
//  Created by Willian on 14/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

struct GoogleSentimentApiEntity {
    struct Sentiment {
        let magnitude: Double?
        let score: Double?
    }
    
    struct Sentence {
        let sentiment: Sentiment?
        let text: Text?
        
        struct Text {
            let beginOffset: Int?
            let content: String?
        }
    }
    
    let documentSentiment: Sentiment?
    let language: String?
    let sentences: [Sentence]?
}

extension GoogleSentimentApiEntity.Sentence.Text: JsonConvertible {
    init(with json: JsonObject?) throws {
        beginOffset = json?["beginOffset"] as? Int
        content = json?["content"] as? String
    }
}

extension GoogleSentimentApiEntity.Sentiment: JsonConvertible {
    init(with json: JsonObject?) throws {
        magnitude = json?["magnitude"] as? Double
        score = json?["score"] as? Double
    }
}

extension GoogleSentimentApiEntity.Sentence: JsonConvertible {
    init(with json: JsonObject?) throws {
        sentiment = try GoogleSentimentApiEntity.Sentiment(with: json?["sentiment"] as? JsonObject)
        text = try Text(with: json?["text"] as? JsonObject)
    }
}

extension GoogleSentimentApiEntity: JsonConvertible {
    init(with json: JsonObject?) throws {
        documentSentiment = try Sentiment(with: json?["documentSentiment"] as? JsonObject)
        sentences = try (json?["sentences"] as? JsonArray)?.compactMap {
            try Sentence(with: $0)
        }
        
        language = json?["language"] as? String
    }
}
