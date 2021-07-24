//
//  ScreenPresenter.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import Foundation
import UIKit

protocol ScreenPresenterInput: AnyObject {
    
    func choosingVC(screenType: ScreenType) -> ScreenVCModel
    func didTappedFirstButton() -> ScreenType
    func didTappedSecondButton() -> ScreenType
    func didTappedThirdButton() -> ScreenType
    func presentSecondVC(screenType: ScreenType)
    func didTappedGoToMenu()
}

protocol ScreenPresenterOutput: AnyObject {
    
}

final class ScreenPresenter: ScreenPresenterInput, ScreenInteractorOutput {
    
    // MARK: - Properties

    weak var view: ScreenPresenterOutput?
    private let interactor: ScreenInteractorInput
    var router: ScreenRouter?
    
    // MARK: - Initializers
    
    init(interactor: ScreenInteractorInput) {
        self.interactor = interactor
    }
    
    // MARK: - Public
    
    func choosingVC(screenType: ScreenType) -> ScreenVCModel {
        
        let screenModel = self.interactor.getScreenVC()
        return screenModel
    }
    
    func presentSecondVC(screenType: ScreenType) {
        
        if let router = router {
            router.screenType = screenType
            router.itIsPopup ? router.presentFullScreenViewController() : router.presentPopupViewController()
        }
    }
    
    func didTappedGoToMenu() {
        if let router = router {
            router.backToMenuViewController(viewController: view as! UIViewController)
        }
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
