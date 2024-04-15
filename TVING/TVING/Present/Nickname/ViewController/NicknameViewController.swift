//
//  NicknameViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/13.
//

import UIKit

import SnapKit
import Then

final class NicknameViewController: UIViewController {

    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let nicknameTextField = UITextField()
    private let saveButton = UIButton()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        print("TAPPED")
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - Extensions

private extension NicknameViewController {

    func setStyle() {
        view.backgroundColor = .tvingWhite

        titleLabel.do {
            $0.text = "닉네임을 입력해주세요."
            $0.textColor = .tvingBlack
            $0.font = .pretendardFont(weight: 500, size: 23)
            $0.textAlignment = .center
        }
        
        nicknameTextField.do {
            $0.backgroundColor = .tvingGray2
            $0.layer.cornerRadius = 3
        }
        
        saveButton.do {
            $0.backgroundColor = .tvingRed
            $0.setTitle("저장하기", for: .normal)
            $0.setTitleColor(.tvingWhite, for: .normal)
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        }
    }
    
    func setHierarchy() {
        view.addSubviews(titleLabel, nicknameTextField, saveButton)
    }
    
    func setLayout() {

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().inset(20)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(21)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
            $0.width.equalTo(335)
        }
    }
}
