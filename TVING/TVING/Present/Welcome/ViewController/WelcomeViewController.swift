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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
    }
    
    @objc
    private func backToLoginButtonDidTap() {
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
}

extension WelcomeViewController {
    func bindData(_ name: String) {
        welcomeView.welcomeLabel.text = "\(name) 님\n반가워요!"
    }
}
