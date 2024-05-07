//
//  HomeHeaderCollectionVIew.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/22.
//

import UIKit

import SnapKit
import Then

final class HomeHeaderCollectionView: UICollectionReusableView {
    
    // MARK: - Properties
    
    private let titleLabel = UILabel()
    private let totalButton = UIButton()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


private extension HomeHeaderCollectionView {
    func setupStyle() {
        self.backgroundColor = .clear
        
        titleLabel.do {
            $0.font = .pretendardFont(weight: 600, size: 15)
            $0.textColor = .tvingWhite
        }
        
        totalButton.do {
            $0.setTitle("전체보기 >", for: .normal)
            $0.setTitleColor(.tvingGray3, for: .normal)
            $0.titleLabel?.font = .pretendardFont(weight: 500, size: 11)
        }
    }
    
    func setupHierarchy() {
        addSubviews(titleLabel, totalButton)
    }
    
    func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(5)
        }
        
        totalButton.snp.makeConstraints {
            $0.bottom.equalTo(titleLabel.snp.bottom)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}

extension HomeHeaderCollectionView {
    // Header Title Label 별 text 다르게
    func configureHeader(forTitle: String) {
        titleLabel.text = forTitle
    }
    
    func resetButton() {
        totalButton.isHidden = true
    }
}
