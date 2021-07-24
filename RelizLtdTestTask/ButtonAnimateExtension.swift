//
//  ButtonAnimateExtension.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/24/21.
//

import UIKit

extension UIButton {
    
    func touchDownAnimate() {
        
        UIView.animate(withDuration: 0.15, animations: { [weak self] in
            guard let self = self else { return }
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        })
    }
    
    func touchUpInsideAnimate() {
        
        UIView.animate(withDuration: 0.15, animations: { [weak self] in
            guard let self = self else { return }
            self.transform = CGAffineTransform.identity
        })
    }
}
