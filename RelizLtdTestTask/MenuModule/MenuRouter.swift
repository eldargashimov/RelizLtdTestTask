//
//  MenuRouter.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import UIKit

protocol MenuRouterProtocol {
    
    func presentScreenViewController()
    func presentPopupViewController()
}

final class MenuRouter: MenuRouterProtocol {
    
    weak var menuViewController: MenuViewController?
    lazy var screenAssembly = ScreenAssembly(screenType: .first)
    
    init(menuViewController: MenuViewController?) {
        self.menuViewController = menuViewController
    }
    
    func presentScreenViewController() {
        
        let screenVC = screenAssembly.configureFullScreenViewController()
        screenVC.modalPresentationStyle = .overFullScreen
        menuViewController?.present(screenVC,animated: true)
    }
    
    func presentPopupViewController() {
        
        let screenVC = screenAssembly.configurePopupScreenViewController()
        screenVC.modalPresentationStyle = .overFullScreen
        screenVC.modalTransitionStyle = .coverVertical
        menuViewController?.present(screenVC, animated: true)
    }
}
