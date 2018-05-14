//
//  DomainProvider.swift
//  Humour
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import Domain
import Store

class DomainProvider {
    let container: Container
    
    init(container: Container) {
        self.container = container
    }

    func configure() {
        
        container.autoregister(Domain.UserRepository.self, initializer: Store.UserRepository.init)
        container.autoregister(Domain.SessionRepository.self, initializer: Store.SessionRepository.init)

        container.register(GetLoggedUserFriendsUseCase.self) {
            GetLoggedUserFriendsUseCase(userRepository: $0.resolve(Domain.UserRepository.self)!,
                                        sessionRepository: $0.resolve(Domain.SessionRepository.self)!)
            
        }
        
        container.register(GetUserTimelineUseCase.self) {
            GetUserTimelineUseCase(userRepository: $0.resolve(Domain.UserRepository.self)!,
                                   sessionRepository: $0.resolve(Domain.SessionRepository.self)!)
            
        }
    }
}
