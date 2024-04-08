//
//  LoginViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {

    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let loginView = LoginView()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
    }
}

// MARK: - Extensions

private extension LoginViewController {

    func setStyle() {
        view.backgroundColor = .tvingBlack
    }
    
    func setHierarchy() {
        view.addSubview(loginView)
    }
    
    func setLayout() {

    }
}
