//
//  NaturalLanguageRepository.swift
//  Domain
//
//  Created by Willian on 14/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

public protocol NaturalLanguageRepository {
    func analyzeSentiment(text: String, completion: @escaping (Result<Sentence>) -> ())
}
