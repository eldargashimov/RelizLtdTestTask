//
//  ScreenPresenter.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import Foundation

protocol ScreenPresenterInput: AnyObject {
    
    func choosingVC(screenType: ScreenType) -> ScreenVCModel
    func didTappedFirstButton() -> ScreenType
    func didTappedSecondButton() -> ScreenType
    func didTappedThirdButton() -> ScreenType
}

protocol ScreenPresenterOutput: AnyObject {
    
}

final class ScreenPresenter: ScreenPresenterInput, ScreenInteractorOutput {
    
    // MARK: - Properties

    weak var view: ScreenPresenterOutput?
    private let interactor: ScreenInteractorInput
    
    // MARK: - Initializers
    
    init(interactor: ScreenInteractorInput) {
        self.interactor = interactor
    }
    
    // MARK: - Public
    
    func choosingVC(screenType: ScreenType) -> ScreenVCModel {
        
        let screenModel = self.interactor.getScreenVC()
        return screenModel
    }
    
    func didTappedFirstButton() -> ScreenType {
        
        let firstScreenType = self.interactor.getFirstButtonScreenType()
        return firstScreenType
    }
    
    func didTappedSecondButton() -> ScreenType {
        
        let secondScreenType = self.interactor.getSecondButtonScreenType()
        return secondScreenType
    }
    
    func didTappedThirdButton() -> ScreenType {
        
        let thirdScreenType = self.interactor.getThirdButtonScreenType()
        return thirdScreenType
    }
}
