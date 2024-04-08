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
    
    
    // MARK: - UI Components
    
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
        mainLabel.do {
            $0.text = StringLiterals.Login.mainTitle
            $0.font = .pretendardFont(weight: 500, size: 23)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        
        idTextField.do {
            $0.placeholder = StringLiterals.Login.idTextField
        }
    }
    
    func setHierarchy() {

    }
    
    func setLayout() {

    }
}
