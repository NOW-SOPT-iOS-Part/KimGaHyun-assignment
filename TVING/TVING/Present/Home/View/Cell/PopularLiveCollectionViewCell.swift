//
//  PopularLiveCollectionViewCell.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/23.
//

import UIKit

import SnapKit
import Then

final class PopularLiveCollectionViewCell: UICollectionViewCell {

    // MARK: - UI Components
    
    private let channelImg = UIImageView()
    private let rankingLabel = UILabel()
    private let infoStack = UIStackView()
    private let entertainLabel = UILabel()
    private let programLabel = UILabel()
    private let percentLabel = UILabel()
    
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

private extension PopularLiveCollectionViewCell {
    func setupStyle() {
        self.backgroundColor = .tvingBlack
        
        rankingLabel.do {
            $0.font = .pretendardFont(weight: 700, size: 19)
            $0.textColor = .tvingWhite
        }
        
        infoStack.do {
            $0.axis = .vertical
            $0.spacing = 0
            $0.alignment = .leading
        }
        
        entertainLabel.do {
            $0.textColor = .tvingWhite
            $0.font = .pretendardFont(weight: 400, size: 10)
        }
        
        [programLabel, percentLabel].forEach {
            $0.do {
                $0.textColor = .tvingGray2
                $0.font = .pretendardFont(weight: 400, size: 10)
            }
        }
    }
    
    func setupHierarchy() {
        addSubviews(channelImg, rankingLabel, infoStack)
        infoStack.addArrangedSubview(entertainLabel)
        infoStack.addArrangedSubview(programLabel)
        infoStack.addArrangedSubview(percentLabel)
    }
    
    func setupLayout() {
        channelImg.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        
        rankingLabel.snp.makeConstraints {
            $0.top.equalTo(channelImg.snp.bottom).offset(8)
            $0.leading.equalTo(channelImg.snp.leading).offset(6)
        }
        
        infoStack.snp.makeConstraints {
            $0.top.equalTo(rankingLabel.snp.top)
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(3)
        }
    }
}


extension PopularLiveCollectionViewCell {
    func bindData(forModel: LiveChannelList) {
        channelImg.image = forModel.channelImg
        rankingLabel.text = forModel.ranking
        entertainLabel.text = forModel.entertain
        programLabel.text = forModel.programTitle
        percentLabel.text = forModel.percent
    }
}
