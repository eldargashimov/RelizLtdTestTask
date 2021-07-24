//
//  MenuInteractor.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import Foundation

protocol MenuInteractorInput {
    
}

protocol MenuInteractorOutput: AnyObject {
    
}

final class MenuInteractor: MenuInteractorInput {
    
    weak var presenter: MenuInteractorOutput?
}
