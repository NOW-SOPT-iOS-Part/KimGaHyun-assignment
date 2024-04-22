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
        
        setAddTarget()
        setDelegate()
    }
}

// MARK: - Extensions

private extension NicknameViewController {
    func setDelegate() {
        nicknameView.nicknameTextField.delegate = self
    }
    func setAddTarget() {
        nicknameView.saveButton.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
    }
}

extension NicknameViewController: UITextFieldDelegate {
    // 한글만 가능하게
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           let titleCharacter = string.cString(using: .utf8)
           let isBackSpace = strcmp(titleCharacter, "\\b")
           if string.hasCharacters() || isBackSpace == -92 {
               return true
           }
           return false
       }
    
    
    // textField 상태에 따라 saveButton 상태 활성화 유무
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if nicknameView.nicknameTextField.text?.count ?? 0 < 1 {
            nicknameView.saveButton.isEnabled = false
            nicknameView.saveButton.backgroundColor = .tvingGray2
        } else {
            nicknameView.saveButton.isEnabled = true
            nicknameView.saveButton.backgroundColor = .tvingRed
        }
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
