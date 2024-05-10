//
//  MovieTableViewCell.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/05/08.
//

import UIKit

import SnapKit
import Then

final class MovieTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    let rankLabel = UILabel()
    let movieTitleLabel = UILabel()
    let openDate = UILabel()
    let viewerCount = UILabel()
    private let rankStakView = UIStackView()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Private Extensions

private extension MovieTableViewCell {
    func setupStyle() {
        self.backgroundColor = .tvingGray3
   
        rankLabel.do {
            $0.font = .pretendardFont(weight: 600, size: 17)
        }
        
        movieTitleLabel.do {
            $0.font = .pretendardFont(weight: 500, size: 14)
        }
        
        openDate.do {
            $0.font = .pretendardFont(weight: 300, size: 10)
        }
        
        viewerCount.do {
            $0.font = .pretendardFont(weight: 300, size: 10)
        }
        
        rankStakView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 5
        }
    }
    
    func setupHierarchy() {
        addSubviews(rankStakView)
        rankStakView.addArrangedSubviews(rankLabel, movieTitleLabel, openDate, viewerCount)
    }
    
    func setupLayout() {
        rankStakView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
    }
}

extension MovieTableViewCell {
    func configureCell(_ data: DailyBoxOfficeList?) {
        rankLabel.text = "\(data?.rank ?? "")위"
        movieTitleLabel.text = data?.movieNm
        openDate.text = "\(data?.openDt ?? "") 개봉"
        viewerCount.text = "\(data?.audiAcc ?? "") 명"
    }
}

