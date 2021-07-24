//
//  MenuPresenter.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import Foundation

protocol MenuPresenterInput: AnyObject {
    
}

protocol MenuPresenterOutput: AnyObject {
    
}

final class MenuPresenter: MenuPresenterInput, MenuInteractorOutput {
    
    // MARK: - Properties
    
    weak var view: MenuPresenterOutput?
    private let interactor: MenuInteractorInput
    
    // MARK: Initializers
    
    init(interactor: MenuInteractorInput) {
        
        self.interactor = interactor
    }
}
