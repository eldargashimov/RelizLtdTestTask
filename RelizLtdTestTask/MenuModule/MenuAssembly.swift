//
//  MenuAssembly.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import Foundation

protocol MenuAssemblyProtocol {
    
    func configureMenuViewController() -> MenuViewController
}

final class MenuAssembly : MenuAssemblyProtocol {
    
    func configureMenuViewController() -> MenuViewController {
        
        let interactor = MenuInteractor()
        let presenter = MenuPresenter(interactor: interactor)
        let view = MenuViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        
        return view
    }
}
