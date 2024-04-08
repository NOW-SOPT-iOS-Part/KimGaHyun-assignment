//
//  LoginView.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import UIKit

import SnapKit
import Then

final class LoginView: UIView {

    // MARK: - Properties
    let loadUnderLine: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue]
    
    // MARK: - UI Components
    
    private let preButton = UIButton()
    private let mainLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    private let idFindButton = UIButton()
    private let passwordFindButton = UIButton()
    private let nonAccountLabel = UILabel()
    private let nicknameButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension LoginView {

    func setStyle() {
        preButton.do {
            $0.setImage(UIImage(resource: .btnBefore), for: .normal)
        }
        
        mainLabel.do {
            $0.text = StringLiterals.Login.mainTitle
            $0.font = .pretendardFont(weight: 500, size: 23)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        
        idTextField.placeholder = StringLiterals.Login.idTextField
        passwordTextField.placeholder = StringLiterals.Login.passwordTextField
    
        [idTextField, passwordTextField].forEach {
            $0.do {
                $0.changePlaceholderColor(forPlaceHolder: $0.placeholder ?? "", forColor: .tvingGray2)
                $0.textColor = .tvingGray2
                $0.font = .pretendardFont(weight: 600, size: 15)
                $0.backgroundColor = .tvingGray4
                $0.layer.cornerRadius = 3
                $0.addPadding(left: 17)
            }
        }
        
        loginButton.do {
            $0.setTitle(StringLiterals.Login.loginBtn, for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.layer.borderColor = UIColor.tvingGray4.cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = .tvingBlack
        }
        
        idFindButton.setTitle(StringLiterals.Login.idFindBtn, for: .normal)
        passwordFindButton.setTitle(StringLiterals.Login.passwordFindBtn, for: .normal)
        
        [idFindButton, passwordFindButton].forEach {
            $0.do {
                $0.setTitleColor(.tvingGray2, for: .normal)
                $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
                $0.backgroundColor = .clear
            }
        }
        
        nonAccountLabel.do {
            $0.text = StringLiterals.Login.nonAccount
            $0.textColor = .tvingGray3
            $0.font = .pretendardFont(weight: 600, size: 14)
            $0.textAlignment = .center
        }
        let attributeString = NSMutableAttributedString(string: StringLiterals.Login.nickname, attributes: loadUnderLine)
        nicknameButton.do {
            //$0.setTitle(StringLiterals.Login.nickname, for: .normal)
            $0.setAttributedTitle(attributeString, for: .normal)
            $0.setTitleColor(.tvingGray3, for: .normal)
            $0.titleLabel?.font = .pretendardFont(weight: 400, size: 14)
            $0.backgroundColor = .clear
        }
    }
    
    func setHierarchy() {
        addSubviews(preButton, mainLabel, idTextField)
        addSubviews(passwordTextField, loginButton, idFindButton, passwordFindButton, nonAccountLabel, nicknameButton)
    }
    
    func setLayout() {
        preButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(65)
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(15)
            $0.width.equalTo(8)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(preButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(109)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(31)
            $0.left.equalToSuperview().inset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.left.equalToSuperview().inset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.left.equalToSuperview().inset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        
        idFindButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().inset(85)
            $0.height.equalTo(22)
        }
        
        passwordFindButton.snp.makeConstraints {
            $0.top.equalTo(idFindButton.snp.top)
            $0.leading.equalTo(idFindButton.snp.trailing).offset(69)
            $0.height.equalTo(22)
        }
      
        nonAccountLabel.snp.makeConstraints {
            $0.top.equalTo(idFindButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(51)
           
        }
        
        nicknameButton.snp.makeConstraints {
            $0.top.equalTo(nonAccountLabel.snp.top)
            $0.leading.equalTo(nonAccountLabel.snp.trailing).offset(17)
            $0.height.equalTo(22)
        }
        
        

    }
}
