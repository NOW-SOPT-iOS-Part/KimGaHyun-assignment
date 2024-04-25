//
//  BaseballCollectionViewCell.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/23.
//

import UIKit

import SnapKit
import Then

final class BaseballCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let bannerImg = UIImageView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Make View
    
    func setView() {
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
}


// MARK: - Private Extensions

private extension BaseballCollectionViewCell {
    func setupStyle() {
        self.backgroundColor = .tvingBlack
        bannerImg.do {
            $0.image = .imgBanner
        }
    }
    
    func setupHierarchy() {
        addSubview(bannerImg)
    }
    
    func setupLayout() {
        bannerImg.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
