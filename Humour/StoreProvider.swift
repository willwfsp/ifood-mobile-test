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

class StoreProvider {
    let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func configure() {
        TWTRTwitter.sharedInstance().start(withConsumerKey: R.string.twitter.customerKey(), consumerSecret: R.string.twitter.customerSecret())
        let twitter = TWTRTwitter.sharedInstance()
        
        container.register(TwitterDataSource.self) { _ in
            TwitterDataSource(twitter: twitter)
        }
        container.register(UserRepository.self) {
            UserRepository(dataSource: $0.resolve(TwitterDataSource.self)!)
        }
        
        container.register(SessionRepository.self) {
            SessionRepository(dataSource: $0.resolve(TwitterDataSource.self)!)
        }
    }
}
