//
//  ScreenInteractor.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import Foundation

protocol ScreenInteractorInput {
    
    func getScreenVC() -> ScreenVCModel
    func getFirstButtonScreenType() -> ScreenType
    func getSecondButtonScreenType() -> ScreenType
    func getThirdButtonScreenType() -> ScreenType
}

protocol ScreenInteractorOutput: AnyObject {
    
    func choosingVC(screenType: ScreenType) -> ScreenVCModel
}

final class ScreenInteractor: ScreenInteractorInput {

    var screenType: ScreenType
    
    init(screenType: ScreenType) {
        
        self.screenType = screenType
    }
    
    weak var presenter: ScreenInteractorOutput?
    
    func getScreenVC() -> ScreenVCModel {
        
        var screenVCModel = ScreenVCModel()
        
        switch screenType {
        case .second:
            
            screenVCModel.screenLabelText = "Screen 2"
            screenVCModel.firstButtonTitle = "Screen 1"
            screenVCModel.secondButtonTitle = "Screen 3"
            screenVCModel.thirdButtonTitle = "Screen 4"
            screenVCModel.colorOfBackground = #colorLiteral(red: 1, green: 0.8075216413, blue: 1, alpha: 1)
        case .third:
            screenVCModel.screenLabelText = "Screen 3"
            screenVCModel.firstButtonTitle = "Screen 1"
            screenVCModel.secondButtonTitle = "Screen 2"
            screenVCModel.thirdButtonTitle = "Screen 4"
            screenVCModel.colorOfBackground = #colorLiteral(red: 0.7818048596, green: 1, blue: 0.9017435908, alpha: 1)
        case .fourth:
            screenVCModel.screenLabelText = "Screen 4"
            screenVCModel.firstButtonTitle = "Screen 1"
            screenVCModel.secondButtonTitle = "Screen 2"
            screenVCModel.thirdButtonTitle = "Screen 3"
            screenVCModel.colorOfBackground = #colorLiteral(red: 0.9935612082, green: 1, blue: 0.8006600738, alpha: 1)
        default:
            screenVCModel.screenLabelText = "Screen 1"
            screenVCModel.firstButtonTitle = "Screen 2"
            screenVCModel.secondButtonTitle = "Screen 3"
            screenVCModel.thirdButtonTitle = "Screen 4"
            screenVCModel.colorOfBackground = #colorLiteral(red: 0.8233212829, green: 0.8068348765, blue: 1, alpha: 1)
        }
        return screenVCModel
    }
    
    func getFirstButtonScreenType() -> ScreenType {
        
        var secondScreenType: ScreenType
        switch screenType {
        case .first:
            secondScreenType = .second
        case .second:
            secondScreenType = .first
        case .third:
            secondScreenType = .first
        case .fourth:
            secondScreenType = .first
        }
        
        return secondScreenType
    }
    
    func getSecondButtonScreenType() -> ScreenType {
        
        var secondScreenType: ScreenType
        switch screenType {
        case .first:
            secondScreenType = .third
        case .second:
            secondScreenType = .third
        case .third:
            secondScreenType = .second
        case .fourth:
            secondScreenType = .second
        }
        
        return secondScreenType
    }
    
    func getThirdButtonScreenType() -> ScreenType {
        
        var secondScreenType: ScreenType
        switch screenType {
        case .first:
            secondScreenType = .fourth
        case .second:
            secondScreenType = .fourth
        case .third:
            secondScreenType = .fourth
        case .fourth:
            secondScreenType = .third
        }
        
        return secondScreenType
    }
}
