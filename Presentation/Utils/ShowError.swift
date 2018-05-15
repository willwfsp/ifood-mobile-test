//
//  ShowError.swift
//  Presentation
//
//  Created by Willian on 15/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation

protocol ShowError where Self: UIViewController {
    func display(error: UserError)
}

extension ShowError {
    func display(error: UserError) {
        switch error.style {
        case .alert:
            showAlert(title: error.title, message: error.localizedDescription)
        case .embeded, .toast: break
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
