//
//  ScreenRouter.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import Foundation

import UIKit

protocol ScreenRouterProtocol {
    
    func presentFullScreenViewController()
    func presentPopupViewController()
    func backToMenuViewController(viewController: UIViewController)
}

final class ScreenRouter: ScreenRouterProtocol {
    
    // MARK: - Properties
    
    var screenType: ScreenType
    weak var screenViewController: ScreenViewController?
    unowned var menuViewController: MenuViewController
    lazy var screenAssembly = ScreenAssembly(screenType: screenType)
    var itIsPopup: Bool
    
    // MARK: - Initializers
    
    init(menuViewController: MenuViewController, screenViewController: ScreenViewController?, screenType: ScreenType, itIsPop: Bool) {
        
        self.menuViewController = menuViewController
        self.screenViewController = screenViewController
        self.screenType = screenType
        self.itIsPopup = itIsPop
    }
    
    // MARK: - Public
    
    func presentFullScreenViewController() {
        
        let view = screenAssembly.configureFullScreenViewController(menuViewController: menuViewController)
        view.modalPresentationStyle = .fullScreen
        menuViewController.present(view, animated: true)
    }
    
    func presentPopupViewController() {
        
        let view = screenAssembly.configurePopupScreenViewController(menuViewController: menuViewController)
        view.modalPresentationStyle = .overCurrentContext
        menuViewController.present(view, animated: true)
    }
    
    func backToMenuViewController(viewController: UIViewController) {
        
        viewController.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
