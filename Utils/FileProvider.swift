//
//  FileProvider.swift
//  Utils
//
//  Created by Willian on 05/05/2018.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation

public struct FileProvider {
    public enum Extension: String {
        case json
    }
    
    public func path(of fileName: String, type: Extension) throws -> String {
        guard let path = Bundle.main.path(forResource: fileName, ofType: type.rawValue)
            else { throw FileError.notFound }
        
        return path
    }
}
