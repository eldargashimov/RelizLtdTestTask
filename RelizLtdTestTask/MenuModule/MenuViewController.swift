//
//  ViewController.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/23/21.
//

import UIKit

final class MenuViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: MenuPresenterInput?
    
    // MARK: - Subviews
    
    private var menuLabel = UILabel()
    private var fullScreenButton = UIButton()
    private var popUpButton = UIButton()
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupMenuLabel()
        setupPopUpButton()
        setupFullScreenButton()
    }
    
    // MARK: - Private
    
    private func setupMenuLabel() {
        
        view.addSubview(menuLabel)
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        menuLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.0).isActive = true
        menuLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        menuLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        menuLabel.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        menuLabel.attributedText = NSMutableAttributedString(string: "Menu", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25.0, weight: .bold)])
        menuLabel.textAlignment = .center
        menuLabel.textColor = #colorLiteral(red: 0.06576282531, green: 0, blue: 0.3522529304, alpha: 1)
    }
    
    private func setupPopUpButton() {
        
        view.addSubview(popUpButton)
        popUpButton.translatesAutoresizingMaskIntoConstraints = false
        popUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30.0).isActive = true
        popUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0).isActive = true
        popUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0).isActive = true
        popUpButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        popUpButton.backgroundColor = #colorLiteral(red: 0.5824098587, green: 0.6236504912, blue: 1, alpha: 1)
        popUpButton.setAttributedTitle(NSMutableAttributedString(string: "Screen 1 - PopUp", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0, weight: .bold)]), for: .normal)
        popUpButton.titleLabel?.textColor = .white
        popUpButton.layer.cornerRadius = 25.0
        popUpButton.clipsToBounds = true
        
        popUpButton.addTarget(self, action: #selector(touchDownPopupButton), for: .touchDown)
        popUpButton.addTarget(self, action: #selector(touchUpInsidePopupButton), for: .touchUpInside)
    }
    
    private func setupFullScreenButton() {
        
        view.addSubview(fullScreenButton)
        fullScreenButton.translatesAutoresizingMaskIntoConstraints = false
        fullScreenButton.bottomAnchor.constraint(equalTo: popUpButton.topAnchor, constant: -20.0).isActive = true
        fullScreenButton.leftAnchor.constraint(equalTo: popUpButton.leftAnchor).isActive = true
        fullScreenButton.rightAnchor.constraint(equalTo: popUpButton.rightAnchor).isActive = true
        fullScreenButton.heightAnchor.constraint(equalTo: popUpButton.heightAnchor).isActive = true
        
        fullScreenButton.backgroundColor = #colorLiteral(red: 0.5824098587, green: 0.6236504912, blue: 1, alpha: 1)
        fullScreenButton.setAttributedTitle(NSMutableAttributedString(string: "Screen 1", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0, weight: .bold)]), for: .normal)
        fullScreenButton.titleLabel?.textColor = .white
        fullScreenButton.layer.cornerRadius = 25.0
        fullScreenButton.clipsToBounds = true
        
        fullScreenButton.addTarget(self, action: #selector(touchDownFullScreenButton), for: .touchDown)
        fullScreenButton.addTarget(self, action: #selector(touchUpInsideFullScreenButton), for: .touchUpInside)
    }
    
    // MARK: - @objc
    
    @objc private func touchUpInsideFullScreenButton() {
        
        presenter?.didTappedFullScreenButton()
        fullScreenButton.touchUpInsideAnimate()
    }
    
    @objc private func touchDownFullScreenButton() {
        
        fullScreenButton.touchDownAnimate()
    }
    
    @objc private func touchUpInsidePopupButton() {
        
        presenter?.didTappedPopupButton()
        popUpButton.touchUpInsideAnimate()
    }
    
    @objc private func touchDownPopupButton() {
        
        popUpButton.touchDownAnimate()
    }
}

extension MenuViewController: MenuPresenterOutput {
    
}
