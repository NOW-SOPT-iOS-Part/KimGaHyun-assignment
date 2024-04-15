//
//  LoginViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController, UISheetPresentationControllerDelegate {

    // MARK: - Properties
    
    let loadUnderLine: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue]

    // MARK: - UI Components
    
    private let mainLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    private let idFindButton = UIButton()
    private let passwordFindButton = UIButton()
    private let nonAccountLabel = UILabel()
    private let nicknameButton = UIButton()
    
    var eyeButton = UIButton(type: .custom)
    private let clearButton = UIButton()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
        setaddTarget()
        setDelegate()
        
        setPasswordShownButtonImage()
    }
    
    @objc func loginButtonDidTap() {
        print("LOGIN BUTTON TAPPED")
        pushToWelcomeVC()
        // loginButton.backgroundColor = .tvingRed
    }
    
    @objc func nicknameButtonTapped() {
        print("NICKNAME BUTTON TAPPED")
        presentToNicknameVC()
    }
    
}

// MARK: - Extensions

private extension LoginViewController {
    func setStyle() {
        
        mainLabel.do {
            $0.text = StringLiterals.Login.mainTitle
            $0.font = .pretendardFont(weight: 500, size: 23)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        
        idTextField.placeholder = StringLiterals.Login.idTextField
        passwordTextField.placeholder = StringLiterals.Login.passwordTextField
        passwordTextField.isSecureTextEntry = true
        
        
        [idTextField, passwordTextField].forEach {
            $0.do {
                $0.changePlaceholderColor(forPlaceHolder: $0.placeholder ?? "", forColor: .tvingGray2)
                $0.textColor = .tvingGray2
                $0.font = .pretendardFont(weight: 600, size: 15)
                $0.backgroundColor = .tvingGray4
                $0.layer.cornerRadius = 3
                $0.addPadding(left: 17)
                $0.clearButtonMode = .whileEditing
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
            $0.setAttributedTitle(attributeString, for: .normal)
            $0.setTitleColor(.tvingGray3, for: .normal)
            $0.titleLabel?.font = .pretendardFont(weight: 400, size: 14)
            $0.backgroundColor = .clear
        }
    }
    
    func setHierarchy() {
        view.addSubviews(mainLabel, idTextField, passwordTextField, loginButton, idFindButton, passwordFindButton, nonAccountLabel, nicknameButton)
    }
    
    func setLayout() {
        
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
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
    
    func setaddTarget() {
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        nicknameButton.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
    }
    
    func setDelegate() {
        passwordTextField.delegate = self
        idTextField.delegate = self
    }
    
    // loginButton Click
    func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.welcomeView.id = idTextField.text
        welcomeViewController.welcomeView.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    // nicknameButton Click
    func presentToNicknameVC() {
        let welcomeViewController = NicknameViewController()
        welcomeViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = welcomeViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]   //지원할 크기 지정
            sheet.delegate = self   //크기 변하는거 감지
            sheet.prefersGrabberVisible = true  //시트 상단에 그래버 표시 (기본 값은 false)
        }
        present(welcomeViewController, animated: true, completion: nil)
    }
    
    func setPasswordShownButtonImage() {
            eyeButton = UIButton(primaryAction: UIAction( handler: { [self]_ in
                passwordTextField.isSecureTextEntry.toggle()
                self.eyeButton.isSelected.toggle()
            }))
            
            var buttonConfig = UIButton.Configuration.plain()
            buttonConfig.imagePadding = 10
            buttonConfig.baseBackgroundColor = .clear
            
            eyeButton.setImage(UIImage(resource: .icSlasheye), for: .normal)
            self.eyeButton.setImage(UIImage(resource: .icEye), for: .selected)
            self.eyeButton.configuration = buttonConfig
            
            passwordTextField.rightView = eyeButton
            passwordTextField.rightViewMode = .always
        }
    
    func updateLoginButtonState(isEnabled: Bool, backgroundColor: UIColor, borderColor: UIColor) {
        loginButton.isEnabled = isEnabled
        loginButton.backgroundColor = backgroundColor
        loginButton.layer.borderColor = borderColor.cgColor
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    // textField가 터치가 되면 테두리 설정
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
        return true
    }
    
    // textField 터치 해제 시 테두리 해제
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = .none
        textField.layer.borderWidth = 0
    }
    
    // textField 상태에 따라 LoginButton 상태 활성화 유
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (idTextField.text?.count ?? 0 < 1) || (passwordTextField.text?.count ?? 0 < 1) {
            updateLoginButtonState(isEnabled: false, backgroundColor: .tvingBlack, borderColor: .tvingGray4)
        } else {
            updateLoginButtonState(isEnabled: true, backgroundColor: .tvingRed, borderColor: .clear)
        }
    }
}
