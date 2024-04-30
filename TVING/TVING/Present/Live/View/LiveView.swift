//
//  LiveView.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/30.
//

import UIKit

import SnapKit
import Then

final class LiveView: UIView {
    
    // MARK: - UI Properties
    
    private let liveImageView = UIImageView()
    let headerCollectionView = TopCollectionView()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension LiveView {
    func setupStyle() {
        liveImageView.image = .imgLiveView
    }
    
    func setupHierarchy() {
      addSubviews(liveImageView, headerCollectionView)
    }
    
    func setupLayout() {
        liveImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
        }
        
        headerCollectionView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(32)
        }
    }
}
