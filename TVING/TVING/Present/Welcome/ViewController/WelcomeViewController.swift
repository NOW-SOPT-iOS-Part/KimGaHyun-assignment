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

    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    let welcomeView = WelcomeView()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @objc
    private func backToLoginButtonDidTap() {
//        if let loginViewController = navigationController?.viewControllers.first(where: { $0 is LoginViewController }) as? LoginViewController {
//            loginViewController.resetTextField()
//        }
        print("TAPPED")
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - Extensions

private extension WelcomeViewController {

    func setStyle() {
        view.backgroundColor = .tvingBlack
        welcomeView.goBackToMainButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
    }
    
    func setHierarchy() {
        view.addSubview(welcomeView)
    }
    
    func setLayout() {

    }
}
