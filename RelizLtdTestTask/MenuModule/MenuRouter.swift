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
    
    // MARK: - Properties
    
    weak var menuViewController: MenuViewController?
    lazy var screenAssembly = ScreenAssembly(screenType: .first)
    
    // MARK: - Initializers
    
    init(menuViewController: UIViewController?) {
        
        self.menuViewController = menuViewController as? MenuViewController
    }
    
    // MARK: - Public
    
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
