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
    
    var movieImage = UIImageView()
    
    // MARK: - Life Cycle
    
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


// MARK: - Private Extensions

private extension MainCollectionViewCell {
    func setupStyle() {
        self.backgroundColor = .tvingBlack
    }
    
    func setupHierarchy() {
        addSubview(movieImage)
    }
    
    func setupLayout() {
        movieImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-100)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}

extension MainCollectionViewCell {
    func bindData(forModel: MainMovieList) {
        movieImage.image = forModel.mainMovieImg
    }
}
