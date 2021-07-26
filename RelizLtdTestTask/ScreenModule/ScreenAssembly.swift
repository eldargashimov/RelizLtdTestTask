//
//  ScreenAssembly.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import Foundation

protocol ScreenAssemblyProtocol {
    
    func configureFullScreenViewController(menuViewController: MenuViewController) -> ScreenViewController
    func configurePopupScreenViewController(menuViewController: MenuViewController) -> ScreenViewController
}

final class ScreenAssembly: ScreenAssemblyProtocol {
    
    // MARK: - Properties
    
    var screenType: ScreenType
    
    // MARK: Initializers
    
    init(screenType: ScreenType) {
        
        self.screenType = screenType
    }
    
    // MARK: - Public
    
    func configureFullScreenViewController(menuViewController: MenuViewController) -> ScreenViewController {
        
        let interactor = ScreenInteractor(screenType: screenType)
        let presenter = ScreenPresenter(interactor: interactor)
        let view = ScreenViewController(screenType: screenType, nibName: nil, bundle: nil, leftAndRightIdent: 0.0, topAndBottonIdent: 0.0)
        let router = ScreenRouter(menuViewController: menuViewController ,screenViewController: view, screenType: screenType, itIsPop: view.itIsPopup)
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func configurePopupScreenViewController(menuViewController: MenuViewController) -> ScreenViewController {
        
        let interactor = ScreenInteractor(screenType: screenType)
        let presenter = ScreenPresenter(interactor: interactor)
        let view = ScreenViewController(screenType: screenType, nibName: nil, bundle: nil, leftAndRightIdent: 50.0, topAndBottonIdent: 75.0)
        let router = ScreenRouter(menuViewController: menuViewController, screenViewController: view, screenType: screenType, itIsPop: view.itIsPopup)
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
