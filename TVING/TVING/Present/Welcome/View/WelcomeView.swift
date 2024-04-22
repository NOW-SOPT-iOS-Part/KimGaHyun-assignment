//
//  WelcomeView.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import UIKit

import SnapKit
import Then

final class WelcomeView: UIView {

    // MARK: - UI Components
    
    private let brandImage = UIImageView()
    let welcomeLabel = UILabel()
    var goBackToMainButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension WelcomeView {
    
    func setStyle() {
        brandImage.do {
            $0.image = UIImage(resource: .imgTVING)
        }
        
        welcomeLabel.do {
            $0.textColor = .tvingWhite
            $0.font = .pretendardFont(weight: 700, size: 23)
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        
        goBackToMainButton.do {
            $0.backgroundColor = .tvingRed
            $0.setTitle("메인으로", for: .normal)
            $0.setTitleColor(.tvingWhite, for: .normal)
            $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
            $0.layer.cornerRadius = 6
        }
    }
    
    func setHierarchy() {
        addSubviews(brandImage, welcomeLabel, goBackToMainButton)
    }
    
    func setLayout() {
        brandImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(210)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(brandImage.snp.bottom).offset(67)
            $0.width.equalTo(244)
            $0.height.equalTo(74)
            $0.centerX.equalTo(brandImage)
        }
        
        goBackToMainButton.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(284)
            $0.centerX.equalTo(brandImage)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
    }
}
