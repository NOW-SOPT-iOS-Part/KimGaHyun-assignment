//
//  MovieViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/30.
//

import UIKit

final class MovieViewController: UIViewController {

    // MARK: - UI Properties
    
    private let movieView = MovieView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = movieView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieView.headerCollectionView.topdelegate = self
    }
}

extension MovieViewController: TopCollectionViewDelegate {
    func navigateToScreen(vc: UIViewController) {
        let vc = vc
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func topCollectionView(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let homeVC = HomeViewController()
            navigateToScreen(vc: homeVC)
        case 1:
            let liveVC = LiveViewController()
            navigateToScreen(vc: liveVC)
        case 2:
            let movieVC = MovieViewController()
            navigateToScreen(vc: movieVC)
        default:
            let homeVC = HomeViewController()
            navigateToScreen(vc: homeVC)
        }
    }
}
