//
//  RestDataStore.swift
//  Store
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils
import Moya

public struct RestDataSource<T: TargetType> {
    public init() {}
    public func request(_ target: T, completion: @escaping (Result<JsonResult>) -> ()) {
        let provider = MoyaProvider<T>()
        
        provider.request(target) {
            switch $0 {
            case let .success(moyaResponse):
                do {
                    let response = try moyaResponse.filterSuccessfulStatusCodes()
                    let data = try response.mapJSON()
                    
                    let json = try JsonResult(any: data)
                    completion(.success(data: json))
                }
                catch {
                    completion(.failure(error: error))
                }
            case let .failure(error):
                completion(.failure(error: error))
            }
        }
    }
}
