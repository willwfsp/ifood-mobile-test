//
//  SearchConfigurator.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class SceneProvider {
    static let shared = SceneProvider()
    private let container: Container
    
    private init() {
        container = Container()
        configure()
    }

    func resolve(_ scene: String) -> UIViewController! {
        return create(storyboard: scene).instantiateInitialViewController()
    }
    
    private func create(storyboard: String) -> UIStoryboard! {
        return SwinjectStoryboard.create(name: storyboard, bundle: nil, container: container)
    }
    
    private func configure() {
        SearchViewController.register(container: container)
    }
}

extension SceneProvider {
    struct Scene { }
}

extension SearchViewController {
    static func register(container: Container) {
        container.storyboardInitCompleted(SearchViewController.self) { (resolver, controller) in
            controller.interactor = SearchInteractor()
        }
    }
}

extension SceneProvider.Scene {
    static let search = "Search"
}
