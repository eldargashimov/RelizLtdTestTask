//
//  MenuPresenter.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import Foundation

protocol MenuPresenterInput: AnyObject {
    
    func didTappedPopupButton()
    func didTappedFullScreenButton()
}

protocol MenuPresenterOutput: AnyObject {
    
}

final class MenuPresenter: MenuPresenterInput {
    
    // MARK: - Properties
    
    weak var view: MenuPresenterOutput?
    var router: MenuRouter?
    
    // MARK: - Public
    
    func didTappedPopupButton() {
        
        router?.presentPopupViewController()
    }
    
    func didTappedFullScreenButton() {
        
        router?.presentScreenViewController()
    }
}
