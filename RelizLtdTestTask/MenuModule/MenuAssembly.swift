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
        
        let view = MenuViewController()
        let router = MenuRouter(menuViewController: view)
        let presenter = MenuPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        return view
    }
}
