//
//  ScreenViewController.swift
//  RelizLtdTestTask
//
//  Created by Mac on 7/23/21.
//

import UIKit

class ScreenViewController: UIViewController {
    
    // MARK: - Properties
    
//    var router: ScreenRouter?
    var presenter: ScreenPresenterInput?
    
    var leftAndRightIdent: CGFloat
    var topAndBottonIdent: CGFloat
    
    var itIsPopup: Bool {
        if leftAndRightIdent != 0 && topAndBottonIdent != 0 {
            return false
        } else {
            return true
        }
    }
    
    // MARK: - Subviews
    
    private var contentView = UIView()
    private var screenLabel = UILabel()
    private var backButton = UIButton()
    private var firstButton = UIButton()
    private var secondButton = UIButton()
    private var thirdButton = UIButton()
    
    // MARK: - Propertys
    
    private var screenModel: ScreenVCModel?
    
    var screenType: ScreenType
    
    // MARK: - Initializers
    
    init(screenType: ScreenType, nibName: String?, bundle: Bundle?, leftAndRightIdent: CGFloat, topAndBottonIdent: CGFloat) {
        
        self.screenType = screenType
        self.leftAndRightIdent = leftAndRightIdent
        self.topAndBottonIdent = topAndBottonIdent
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let model = self.presenter?.choosingVC(screenType: screenType) else { return }
        screenModel = model
        self.contentView.backgroundColor = screenModel?.colorOfBackground
        setupContentView()
        setupBackButton()
        setupScreenLabel()
        setupThirdButton()
        setupSecondButton()
        setupFirstButton()
    }
    
    // MARK: - Private
    
    private func setupContentView() {
        
        if !itIsPopup {
            contentView.layer.cornerRadius = 25.0
            contentView.clipsToBounds = true
        }
        
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: topAndBottonIdent).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftAndRightIdent).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftAndRightIdent).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -topAndBottonIdent).isActive = true
    }
    
    private func setupBackButton() {
        
        contentView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60.0).isActive = true
        backButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.addTarget(self, action: #selector(backToMenu), for: .touchUpInside)
    }
    
    private func setupScreenLabel() {
        
        contentView.addSubview(screenLabel)
        screenLabel.translatesAutoresizingMaskIntoConstraints = false
        screenLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60.0).isActive = true
        screenLabel.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 10).isActive = true
        screenLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -80).isActive = true
        screenLabel.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        screenLabel.textColor = #colorLiteral(red: 0.06576282531, green: 0, blue: 0.3522529304, alpha: 1)
        screenLabel.attributedText = NSMutableAttributedString(string: screenModel!.screenLabelText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25.0, weight: .bold)])
        screenLabel.textAlignment = .center
    }
    
    private func setupFirstButton() {
        
        contentView.addSubview(firstButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.bottomAnchor.constraint(equalTo: secondButton.topAnchor, constant: -20.0).isActive = true
        firstButton.leftAnchor.constraint(equalTo: secondButton.leftAnchor).isActive = true
        firstButton.rightAnchor.constraint(equalTo: secondButton.rightAnchor).isActive = true
        firstButton.heightAnchor.constraint(equalTo: secondButton.heightAnchor).isActive = true
        
        firstButton.backgroundColor = #colorLiteral(red: 0.5824098587, green: 0.6236504912, blue: 1, alpha: 1)
        firstButton.setAttributedTitle(NSMutableAttributedString(string: screenModel!.firstButtonTitle, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0, weight: .bold)]), for: .normal)
        firstButton.titleLabel?.textColor = .white
        firstButton.layer.cornerRadius = 25.0
        firstButton.clipsToBounds = true
        
        firstButton.addTarget(self, action: #selector(touchDownFirstButton), for: .touchDown)
        firstButton.addTarget(self, action: #selector(touchUpInsideFirstButton), for: .touchUpInside)
    }
    
    private func setupSecondButton() {
        
        contentView.addSubview(secondButton)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.bottomAnchor.constraint(equalTo: thirdButton.topAnchor, constant: -20.0).isActive = true
        secondButton.leftAnchor.constraint(equalTo: thirdButton.leftAnchor).isActive = true
        secondButton.rightAnchor.constraint(equalTo: thirdButton.rightAnchor).isActive = true
        secondButton.heightAnchor.constraint(equalTo: thirdButton.heightAnchor).isActive = true
        
        secondButton.backgroundColor = #colorLiteral(red: 0.5824098587, green: 0.6236504912, blue: 1, alpha: 1)
        secondButton.setAttributedTitle(NSMutableAttributedString(string: screenModel!.secondButtonTitle, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0, weight: .bold)]), for: .normal)
        secondButton.titleLabel?.textColor = .white
        secondButton.layer.cornerRadius = 25.0
        secondButton.clipsToBounds = true
        
        secondButton.addTarget(self, action: #selector(touchDownSecondButton), for: .touchDown)
        secondButton.addTarget(self, action: #selector(touchUpInsideSecondButton), for: .touchUpInside)
    }
    
    private func setupThirdButton() {
        
        contentView.addSubview(thirdButton)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30.0).isActive = true
        thirdButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0).isActive = true
        thirdButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20.0).isActive = true
        thirdButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        thirdButton.backgroundColor = #colorLiteral(red: 0.5824098587, green: 0.6236504912, blue: 1, alpha: 1)
        thirdButton.setAttributedTitle(NSMutableAttributedString(string: screenModel!.thirdButtonTitle, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0, weight: .bold)]), for: .normal)
        thirdButton.titleLabel?.textColor = .white
        thirdButton.layer.cornerRadius = 25.0
        thirdButton.clipsToBounds = true
        
        thirdButton.addTarget(self, action: #selector(touchDownThirdButton), for: .touchDown)
        thirdButton.addTarget(self, action: #selector(touchUpInsideThirdButton), for: .touchUpInside)
    }
    
    private func presentVC(secondScreenType: ScreenType) {
        
        presenter?.presentSecondVC(screenType: secondScreenType)
    }
    
    // MARK: - @objc
    
    @objc
    private func touchUpInsideFirstButton() {
        
        guard let secondScreenType = presenter?.didTappedFirstButton() else { return }
        presentVC(secondScreenType: secondScreenType)
        firstButton.touchUpInsideAnimate()
    }
    
    @objc
    private func touchDownFirstButton() {
        
        firstButton.touchDownAnimate()
    }
    
    @objc
    private func touchUpInsideSecondButton() {
        
        guard let secondScreenType = presenter?.didTappedSecondButton() else { return }
        presentVC(secondScreenType: secondScreenType)
        secondButton.touchUpInsideAnimate()
    }
    
    @objc
    private func touchDownSecondButton() {

        secondButton.touchDownAnimate()
    }
    
    @objc
    private func touchUpInsideThirdButton() {
        
        guard let secondScreenType = presenter?.didTappedThirdButton() else { return }
        presentVC(secondScreenType: secondScreenType)
        thirdButton.touchUpInsideAnimate()
    }
    
    @objc
    private func touchDownThirdButton() {
        
        thirdButton.touchDownAnimate()
    }
    
    @objc
    private func backToMenu() {
        
        presenter?.didTappedGoToMenu()
    }
}

extension ScreenViewController: ScreenPresenterOutput {
    
}
