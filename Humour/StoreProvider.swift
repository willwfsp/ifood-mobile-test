//
//  StoreProvider.swift
//  Humour
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import TwitterKit
import Store
import Utils

class StoreProvider {
    let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func configure() {
        TWTRTwitter.sharedInstance().start(withConsumerKey: Constants.string.twitter.customerKey, consumerSecret: Constants.string.twitter.customerSecret)
        let twitter = TWTRTwitter.sharedInstance()
        
        container.register(TwitterDataSource.self) { _ in
            TwitterDataSource(twitter: twitter)
        }
        
        container.register(RestDataSource.self) { (r) -> RestDataSource<NaturalLanguageService> in
            RestDataSource<NaturalLanguageService>()
        }
    }
}
