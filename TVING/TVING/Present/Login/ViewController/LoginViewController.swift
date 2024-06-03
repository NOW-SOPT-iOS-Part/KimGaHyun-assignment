//
//  LoginViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

protocol idDelegate: AnyObject {
    func idBinding(id: String)
}

final class LoginViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    // MARK: - Properties
    
    weak var delegate: idDelegate?
    var name: String = ""
    
    let viewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let loginView = LoginView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
        setDelegate()
        bindViewModel()
    }
}

// MARK: - Extensions

private extension LoginViewController {
    func setAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        loginView.nicknameButton.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
        loginView.clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }
    
    func setDelegate() {
        loginView.passwordTextField.delegate = self
        loginView.idTextField.delegate = self
    }

    func bindViewModel() {
        loginView.idTextField.rx.text
            .bind(to: viewModel.idTextFieldText)
            .disposed(by: disposeBag)
        
        loginView.passwordTextField.rx.text
            .bind(to: viewModel.passwordTextFieldText)
            .disposed(by: disposeBag)
        
        viewModel.isLoginButtonEnabled
            .bind(to: loginView.loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.loginButtonBackgroundColor
            .bind(to: loginView.loginButton.rx.backgroundColor)
            .disposed(by: disposeBag)
        
        viewModel.loginButtonBorderColor
            .subscribe(onNext: { [weak self] color in
                self?.loginView.loginButton.layer.borderColor = color.cgColor
            })
            .disposed(by: disposeBag)
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
}

extension LoginViewController {
    
    // @objc func
    @objc func loginButtonDidTap() {
        print("LOGIN BUTTON TAPPED")
        pushToWelcomeVC()
    }
    
    
    @objc func nicknameButtonTapped() {
        print("NICKNAME BUTTON TAPPED")
        presentToNicknameVC()
    }
    
    @objc func clearButtonTapped() {
        loginView.passwordTextField.text = ""
    }
    
    // loginButton Click
    func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        if name == "" {
            welcomeViewController.idBinding(id: loginView.idTextField.text ?? "")
        } else {
            welcomeViewController.idBinding(id: name)
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    // nicknameButton Click
    func presentToNicknameVC() {
        let nicknameViewController = NicknameViewController()
        nicknameViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = nicknameViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.delegate = self
            sheet.prefersGrabberVisible = true 
            sheet.preferredCornerRadius = 20
        }
        nicknameViewController.delegate = self
        nicknameViewController.dataBind(self.name)
        present(nicknameViewController, animated: true, completion: nil)
    }
}

extension LoginViewController: NickNameDelegate {
    func bindNickName(nickname: String) {
        self.name = nickname
    }
}
