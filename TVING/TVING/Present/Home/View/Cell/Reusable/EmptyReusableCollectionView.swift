//
//  EmptyReusableCollectionViewCell.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/23.
//

import UIKit

import SnapKit
import Then

final class EmptyReusableCollectionView: UICollectionReusableView {
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
