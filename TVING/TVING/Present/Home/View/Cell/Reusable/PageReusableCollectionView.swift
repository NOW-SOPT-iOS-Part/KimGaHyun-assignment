//
//  PageReusableCollectionView.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/30.
//

import UIKit

import SnapKit
import Then

final class PageReusableCollectionView: UICollectionReusableView {
    
    let pageControl = UIPageControl()
    
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

private extension PageReusableCollectionView {
    func setupStyle() {
        self.backgroundColor = .clear
        
        pageControl.do {
            $0.hidesForSinglePage = true
            $0.pageIndicatorTintColor = .tvingGray3
            $0.currentPageIndicatorTintColor = .tvingWhite
            $0.currentPage = 0
            $0.numberOfPages = 5
            $0.transform = CGAffineTransform(scaleX: 0.7 , y: 0.7)
        }
    }
    
    func setupHierarchy() {
        addSubview(pageControl)
    }
    
    func setupLayout() {
        pageControl.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(7)
        }
    }
    
}

extension PageReusableCollectionView {
    func setupPageIndex(forIndex: Int) {
        pageControl.currentPage = forIndex
    }
}
