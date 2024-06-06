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
            if let img = UIImage(systemName: "house") { return img.withTintColor(.tvingGray2)} else { return nil }
        case .toBeReleased:
            if let img = UIImage(systemName: "play.rectangle") { return img.withTintColor(.tvingGray2)} else { return nil }
        case .search:
            if let img = UIImage(systemName: "magnifyingglass") { return img.withTintColor(.tvingGray2)} else { return nil }
        case .history:
            if let img = UIImage(systemName: "clock.arrow.circlepath") { return img.withTintColor(.tvingGray2)} else { return nil }
        }
    }
    
    // 선택된 탭
    var selectedItem: UIImage? {
        switch self {
        case .home:
            if let img = UIImage(systemName: "house") { return img.withTintColor(.tvingWhite)} else { return nil }
        case .toBeReleased:
            if let img = UIImage(systemName: "play.rectangle") { return img.withTintColor(.tvingWhite)} else { return nil }
        case .search:
            if let img = UIImage(systemName: "magnifyingglass") { return img.withTintColor(.tvingWhite)} else { return nil }
        case .history:
            if let img = UIImage(systemName: "clock.arrow.circlepath") { return img.withTintColor(.tvingWhite)} else { return nil }
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
        case .toBeReleased: return LoginViewController()
        case .search: return HomeViewController()
        case .history: return HomeViewController()
        }
    }
}
