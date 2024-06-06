//
//  WelcomeViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import UIKit

import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    let welcomeView = WelcomeView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = welcomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
        setDelegate()
    }
}

// MARK: - Extensions

private extension WelcomeViewController {
    func setDelegate() {
        let loginViewController = LoginViewController()
        loginViewController.delegate = self
    }
    
    func setAddTarget() {
        welcomeView.goBackToMainButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
    }
    
    @objc func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension WelcomeViewController: idDelegate {
    func idBinding(id: String) {
        welcomeView.welcomeLabel.text = id + "님 반가워요!🩷"
    }
}
