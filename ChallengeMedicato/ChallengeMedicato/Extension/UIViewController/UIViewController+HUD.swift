//
//  UIViewController+HUD.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    func showHud() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }

    func hideHud() {
        MBProgressHUD.hide(for: view, animated: true)
    }

    func showErrorHud() {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = "Error, please try again"
        hud.hide(animated: true, afterDelay: 2.0)
    }
}
