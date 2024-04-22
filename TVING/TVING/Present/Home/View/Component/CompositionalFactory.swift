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
            case 1:
                section = tvingMustContents()
            case 2:
                section = tvingLiveChannel()
            case 3:
                section = tvingPopularSeries()
            case 4:
                section = tvingBaseBall()
            default:
                section = tvingMainSection()
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
        section.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                        leading: itemInset,
                                                        bottom: itemInset,
                                                        trailing: itemInset)
        
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
                                               heightDimension: .absolute(150))
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
        let itemFractionalWidthFraction = 1.0
        let itemInset: CGFloat = 7

        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                     leading: itemInset,
                                                     bottom: itemInset,
                                                     trailing: itemInset)

        // group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(600)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitem: item,
                                                     count: 5)

        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                        leading: itemInset,
                                                        bottom: itemInset,
                                                        trailing: itemInset)

        // Header, Footer
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                          heightDimension: .absolute(50)),
                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                        alignment: .top)]
        return section
    }

    // MARK: - '1화 무료! 파라마운트 + 인기 시리즈' 에 대한 Layout

    static func tvingPopularSeries() -> NSCollectionLayoutSection {
        let itemFractionalWidthFraction = 1.0 / 3.0
        let itemInset: CGFloat = 7

        // item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(itemFractionalWidthFraction),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                     leading: itemInset,
                                                     bottom: itemInset,
                                                     trailing: itemInset)

        // group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(115)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        // section
        let section = NSCollectionLayoutSection(group: group)
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
        let itemFractionalWidthFraction = 1.0 / 3.0
        let itemInset: CGFloat = 7

        // item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(itemFractionalWidthFraction),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                     leading: itemInset,
                                                     bottom: itemInset,
                                                     trailing: itemInset)

        // group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(115)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                        leading: itemInset,
                                                        bottom: itemInset,
                                                        trailing: itemInset)
        return section
    }

    // MARK: - '마술보다 더 신비로운 영화(신비로운 영화사전님)' 에 대한 Layout

    static func tvingMagicMovie() -> NSCollectionLayoutSection {
        let itemFractionalWidthFraction = 1.0 / 3.0
        let itemInset: CGFloat = 7

        // item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(itemFractionalWidthFraction),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                     leading: itemInset,
                                                     bottom: itemInset,
                                                     trailing: itemInset)

        // group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(115)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        // section
        let section = NSCollectionLayoutSection(group: group)
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
}
