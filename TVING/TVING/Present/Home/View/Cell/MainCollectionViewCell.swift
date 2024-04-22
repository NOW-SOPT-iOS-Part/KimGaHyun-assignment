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
    
    static let identifier = "MainCollectionViewCell"
    
    // MARK: - UI Components
    
    private let movieImage = UIImageView()

    
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
    }
    
    func setupHierarchy() {
        addSubview(movieImage)
    }
    
    func setupLayout() {
        movieImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


extension MainCollectionViewCell {
    func bindData(forModel: MainMovieList) {
        movieImage.image = forModel.mainMovieImg
    }
}
