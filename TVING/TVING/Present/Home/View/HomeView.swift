//
//  HomeView.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/22.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {
    
    // MARK: - Properties
    
    private let collectionViewLayout = CompositionalFactory.create()
    private(set) lazy var collectionView = UICollectionView(frame: .zero,
                                                            collectionViewLayout: collectionViewLayout)

    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension HomeView {
    // MARK: - set Hierarchy
    
    func setupHierarchy() {
        self.addSubview(collectionView)
    }
    
    // MARK: - set Layout
    
     func setupLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}