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
        
        setaddTarget()
    }
}

// MARK: - Extensions

private extension WelcomeViewController {
    func setaddTarget() {
        welcomeView.goBackToMainButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
    }
}

extension WelcomeViewController {
    func bindData(_ name: String) {
        welcomeView.welcomeLabel.text = "\(name) 님\n반가워요!"
    }
    
    @objc func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
