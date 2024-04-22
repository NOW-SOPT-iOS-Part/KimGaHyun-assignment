//
//  MovieCollectionViewCell.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/22.
//

import UIKit

import SnapKit
import Then

final class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    
    // MARK: - UI Components
    
    private let movieImage = UIImageView()
    private let titleLabel = UILabel()

    
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

private extension MovieCollectionViewCell {
    func setupStyle() {
        self.backgroundColor = .tvingBlack
        
        titleLabel.do {
            $0.font = .pretendardFont(weight: 500, size: 10)
            $0.textColor = .tvingGray2
        }
    }
    
    func setupHierarchy() {
        addSubviews(movieImage, titleLabel)
    }
    
    func setupLayout() {
        movieImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.leading.equalToSuperview().inset(3)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(movieImage.snp.bottom).offset(3)
            $0.leading.equalTo(movieImage.snp.leading)
        }
    }
}


extension MovieCollectionViewCell {
    func bindData(forModel: MovieList) {
        movieImage.image = forModel.movieImg
        titleLabel.text = forModel.movieTitle
    }
}
