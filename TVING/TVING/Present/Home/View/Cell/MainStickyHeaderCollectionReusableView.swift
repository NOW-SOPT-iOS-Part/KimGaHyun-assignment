//
//  MainStickyHeaderCollectionReusableView.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/28.
//

import UIKit

import SnapKit
import Then

final class MainStickyHeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - UI Properties
   
    let homeButton = UIButton()
    let liveButton = UIButton()
    let tvProgramButton = UIButton()
    let movieButton = UIButton()
    let paramountButton = UIButton()
    
    private let headerStackView = UIStackView()
    
    private var buttonLabelText = ["홈", "실시간", "TV프로그램", "영화", "파라마운트+"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        backgroundColor = .white
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }

    
    func setupStyle() {
    
        self.backgroundColor = .black
        // i는 index, j는 element
        for (i, j) in [homeButton, liveButton, tvProgramButton, movieButton, paramountButton].enumerated() {
            j.do {
                $0.setTitle(buttonLabelText[i], for: .normal)
                $0.setTitleColor(.tvingWhite, for: .normal)
                $0.titleLabel?.font = .pretendardFont(weight: 400, size: 17)
            }
        }
        
        headerStackView.do {
            $0.axis = .horizontal
            $0.spacing = 28
            $0.alignment = .center
        }
    }

    
    func setupHierarchy() {
        addSubviews(headerStackView)
        headerStackView.addArrangedSubviews(homeButton, liveButton, tvProgramButton, movieButton, paramountButton)
    }

    func setupLayout() {
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
    }
    
}

