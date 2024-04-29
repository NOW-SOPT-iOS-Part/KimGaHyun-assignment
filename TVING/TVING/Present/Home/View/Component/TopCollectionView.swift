//
//  TopCollectionView.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/30.
//

import UIKit

import SnapKit
import Then


final class TopCollectionView: UICollectionView {
    
    let data = ["홈", "실시간", "TV프로그램", "영화", "파라마운트+"]
    var parentViewController: HomeViewController?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
   
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.className)
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("클릭된 셀 : ", indexPath.row)

    }
    
}

extension TopCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.className, for: indexPath)
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let label = UILabel(frame: cell.contentView.bounds)
        label.text = data[indexPath.item]
        label.textAlignment = .center
        label.textColor = .tvingWhite
        label.font = .pretendardFont(weight: 400, size: 17)
        cell.contentView.addSubview(label)
        
        return cell
    }
}

extension TopCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        switch indexPath.row {
        case 0:
            return CGSize(width: 41, height: height)
        case 1:
            return CGSize(width: 70, height: height)
        case 2:
            return CGSize(width: 104, height: height)
        case 3:
            return CGSize(width: 55, height: height)
        case 4:
            return CGSize(width: 108, height: height)
        default:
            return CGSize(width: 100, height: height)
        }
    }
}
