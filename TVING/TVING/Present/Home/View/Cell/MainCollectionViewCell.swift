//
//  MainCollectionViewCell.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/22.
//

import UIKit

import SnapKit
import Then

final class MainCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - UI Components
    
    private let movieImage = UIImageView()
    private let pageControl = UIPageControl()
    
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

private extension MainCollectionViewCell {
    func setupStyle() {
        self.backgroundColor = .tvingBlack
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = 5
        pageControl.pageIndicatorTintColor = .darkGray
    }
    
    func setupHierarchy() {
        addSubview(movieImage)
        addSubview(pageControl)
    }
    
    func setupLayout() {
        movieImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-100)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        pageControl.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}


extension MainCollectionViewCell {
    func bindData(forModel: MainMovieList) {
        movieImage.image = forModel.mainMovieImg
    }
}
