//
//  SearchConfigurator.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Presentation
import Swinject
import SwinjectStoryboard

class SceneProvider {
    let container: Container
    
    init(container: Container) {
        self.container = container
    }

    func resolve(_ scene: String) -> UIViewController! {
        return create(storyboard: scene).instantiateInitialViewController()
    }
    
    private func create(storyboard: String) -> UIStoryboard! {
        return SwinjectStoryboard.create(name: storyboard, bundle: Bundle(identifier: "com.policiano.Presentation"), container: container)
    }
    
    func configure() {
        SearchViewController.register(container: container)
    }
}
