//
//  TabBarItem.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/29.
//

import UIKit

enum TabBarItem: CaseIterable {
    case home, toBeReleased, search, history

    // 선택되지 않은 탭
    var normalItem: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house")!.withTintColor(.tvingGray2)
        case .toBeReleased:
            return UIImage(systemName: "play.rectangle")!.withTintColor(.tvingGray2)
        case .search:
            return UIImage(systemName: "magnifyingglass")!.withTintColor(.tvingGray2)
        case .history:
            return UIImage(systemName: "clock.arrow.circlepath")!.withTintColor(.tvingGray2)
        }
    }
    
    // 선택된 탭
    var selectedItem: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house")!.withTintColor(.tvingWhite)
        case .toBeReleased:
            return UIImage(systemName: "play.rectangle")!.withTintColor(.tvingWhite)
        case .search:
            return UIImage(systemName: "magnifyingglass")!.withTintColor(.tvingWhite)
        case .history:
            return UIImage(systemName: "clock.arrow.circlepath")!.withTintColor(.tvingWhite)
        }
    }
    
    // 탭 별 제목
    var itemTitle: String? {
        switch self {
        case .home: return "홈"
        case .toBeReleased: return "공개예정"
        case .search: return "검색"
        case .history: return "기록"
        }
    }
    
    var targetViewController: UIViewController {
        switch self {
        case .home: return HomeViewController()
        case .toBeReleased: return HomeViewController()
        case .search: return HomeViewController()
        case .history: return HomeViewController()
        }
    }
}
