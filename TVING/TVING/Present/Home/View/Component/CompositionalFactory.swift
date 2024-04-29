//
//  CompositionalFactory.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/22.
//

import UIKit

// MARK: - Compositional Layout

enum CompositionalFactory {
    static func create() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _ environment) -> NSCollectionLayoutSection? in
            let section: NSCollectionLayoutSection
            switch sectionNumber {
            case 0:
                section = tvingMainSection()
            case 2:
                section = tvingLiveChannel()
            case 4:
                section = tvingBaseBall()
            default:
                section = tvingMustContents()
            }
            return section
        }
    }
    
    // MARK: - Main Section Layout
    
    static func tvingMainSection() -> NSCollectionLayoutSection {
        let itemFractionalWidthFraction = 1.0
        let itemInset: CGFloat = 0
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                     leading: itemInset,
                                                     bottom: itemInset,
                                                     trailing: itemInset)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(560))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                        leading: itemInset,
                                                        bottom: itemInset,
                                                        trailing: itemInset)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
   
        // this activates the "sticky" behavior
        headerElement.pinToVisibleBounds = true
        section .boundarySupplementaryItems = [headerElement]
        
        // Header
//        section.boundarySupplementaryItems = [
//            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
//                                                                          heightDimension: .absolute(40)),
//                                                        elementKind: UICollectionView.elementKindSectionHeader,
//                                                        alignment: .top)]
        
        return section
    }
    
    // MARK: - '티빙에서 꼭 봐야하는 컨텐츠' 에 대한 Layout
    
    static func tvingMustContents() -> NSCollectionLayoutSection {
        let itemFractionalWidthFraction = 1.0 / 4.0
        let itemInset: CGFloat = 1
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                                              heightDimension: .absolute(148))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                     leading: itemInset,
                                                     bottom: itemInset,
                                                     trailing: itemInset)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(155))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                        leading: itemInset,
                                                        bottom: itemInset,
                                                        trailing: itemInset)
        
        // Header
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                          heightDimension: .absolute(40)),
                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                        alignment: .top)]
        return section
    }
    
    // MARK: - '인기 LIVE 채널' 에 대한 Layout
    
    static func tvingLiveChannel() -> NSCollectionLayoutSection {
        let itemFractionalWidthFraction = 1.0 / 3.0
        let itemInset: CGFloat = 1
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                     leading: itemInset,
                                                     bottom: itemInset,
                                                     trailing: itemInset)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.1),
                                               heightDimension: .estimated(140))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item,
                                                       count: 5)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                        leading: itemInset,
                                                        bottom: itemInset,
                                                        trailing: itemInset)
        
        // Header
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                          heightDimension: .absolute(50)),
                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                        alignment: .top)]
        return section
    }
    
    // MARK: - 야구 배너 에 대한 Layout
    
    static func tvingBaseBall() -> NSCollectionLayoutSection {
        let itemFractionalWidthFraction = 1.0 / 2.0
        let itemInset: CGFloat = 1
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .estimated(58))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                     leading: itemInset,
                                                     bottom: itemInset,
                                                     trailing: itemInset)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(58))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                        leading: itemInset,
                                                        bottom: itemInset,
                                                        trailing: itemInset)
        
        // Header
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                          heightDimension: .absolute(50)),
                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                        alignment: .top),
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                          heightDimension: .absolute(17)),
                                                        elementKind: UICollectionView.elementKindSectionFooter,
                                                        alignment: .bottom)]
        
        return section
    }
}
