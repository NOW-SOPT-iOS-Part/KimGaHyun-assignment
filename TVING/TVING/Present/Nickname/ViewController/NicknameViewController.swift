//
//  NicknameViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/13.
//

import UIKit

import SnapKit
import Then

protocol NickNameDelegate: AnyObject {
    func bindNickName(nickname: String)
}

final class NicknameViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: NickNameDelegate?
    
    // MARK: - UI Components
    
    private let nicknameView = NicknameView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = nicknameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setaddTarget()
    }
}

// MARK: - Extensions

private extension NicknameViewController {
    func setaddTarget() {
        nicknameView.saveButton.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
    }
}

extension NicknameViewController {
    func dataBind(_ name: String) {
        if name != "" {
            nicknameView.nicknameTextField.text = name
        }
    }
    
    @objc func saveButtonDidTap() {
        print("SAVE BUTTON TAPPED")
        if let nickname = nicknameView.nicknameTextField.text {
            delegate?.bindNickName(nickname: nickname)
            self.dismiss(animated: true)
        }
    }
    
}
