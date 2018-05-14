//
//  SwinjectStoryboard.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard
import Utils

struct DependencyInjection {
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func resolve(_ scene: String) -> UIViewController! {
        return SwinjectStoryboard.create(name: scene, bundle: Bundle(identifier: Constants.bundle.presentation), container: container).instantiateInitialViewController()
    }
}
