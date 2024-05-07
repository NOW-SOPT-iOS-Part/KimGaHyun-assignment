//
//  TabBarController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/29.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        self.setupUI()
        self.addTabBarController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationItem.hidesBackButton = true
    }
  
    func setupNavigationBar() {
        let leftImage = UIImage(resource: .imgTVING2)
        let leftImageView = UIImageView(image: leftImage)
        let leftBarButton = UIBarButtonItem(customView: leftImageView)
        
        let rightImage = UIImage(resource: .imgDoosan)
        let rightImageView = UIImageView(image: rightImage)
        let rightBarButton = UIBarButtonItem(customView: rightImageView)
        
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    // MARK: - Set UI
    
    private func setupUI() {
        self.view.backgroundColor = .tvingBlack
        tabBar.backgroundColor = .tvingBlack
        tabBar.barTintColor = .tvingBlack
        tabBar.unselectedItemTintColor = .tvingWhite
        tabBar.isTranslucent = false
    }
    
    func addTabBarController() {
        let viewControllers = TabBarItem.allCases.map {
            let currentViewController = createViewController(
                title: $0.itemTitle ?? "",
                image: $0.normalItem ?? UIImage(),
                selectedImage: $0.selectedItem ?? UIImage(),
                viewController: $0.targetViewController
            )
            return currentViewController
        }
        setViewControllers(viewControllers, animated: false)
    }
    
    func createViewController(title: String,
                              image: UIImage,
                              selectedImage: UIImage,
                              viewController: UIViewController) -> UIViewController {
        let currentViewController = viewController
        let tabbarItem = UITabBarItem(
            title: title,
            image: image.withRenderingMode(.alwaysOriginal),
            selectedImage: selectedImage.withRenderingMode(.alwaysOriginal)
        )
        
        // title이 선택되지 않았을 때 폰트, 색상 설정
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.pretendardFont(weight: 300, size: 10),
            .foregroundColor: UIColor.tvingGray2
        ]
        
        // title이 선택되었을 때 폰트, 색상 설정
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.pretendardFont(weight: 300, size: 10),
            .foregroundColor: UIColor.tvingWhite
        ]
        
        tabbarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        tabbarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        tabbarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        currentViewController.tabBarItem = tabbarItem
        
        return currentViewController
    }
}

