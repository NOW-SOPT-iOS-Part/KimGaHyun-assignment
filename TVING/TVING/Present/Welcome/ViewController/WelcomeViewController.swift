//
//  WelcomeViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import UIKit

import SnapKit
import Then

protocol DataBindProtocol: AnyObject {
    func dataBind(nickname: String?)
}

final class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: DataBindProtocol?
    
    // MARK: - UI Components
    
    let welcomeView = WelcomeView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        
        bindID()
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        if let id = welcomeView.id {
            delegate?.dataBind(nickname: id)
        }

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
    private func bindID() {
        guard let idText = welcomeView.id else { return }
        self.welcomeView.welcomeLabel.text = "\(idText)님 \n반가워요!"
    }
}
