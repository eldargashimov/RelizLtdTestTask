//
//  ScreenAssembly.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import Foundation

protocol ScreenAssemblyProtocol {
    
    func configureFullScreenViewController() -> ScreenViewController
    func configurePopupScreenViewController() -> ScreenViewController
}

final class ScreenAssembly: ScreenAssemblyProtocol {
    
    var screenType: ScreenType
    
    init(screenType: ScreenType) {
        self.screenType = screenType
    }
    
    func configureFullScreenViewController() -> ScreenViewController {
        
        let interactor = ScreenInteractor(screenType: screenType)
        let presenter = ScreenPresenter(interactor: interactor)
        let view = ScreenViewController(screenType: screenType, nibName: nil, bundle: nil, leftAndRightIdent: 0.0, topAndBottonIdent: 0.0)
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        
        return view
    }
    
    func configurePopupScreenViewController() -> ScreenViewController {
        
        let interactor = ScreenInteractor(screenType: screenType)
        let presenter = ScreenPresenter(interactor: interactor)
        let view = ScreenViewController(screenType: screenType, nibName: nil, bundle: nil, leftAndRightIdent: 50.0, topAndBottonIdent: 75.0)
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        
        return view
    }
}
