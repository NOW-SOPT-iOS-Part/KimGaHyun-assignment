//
//  MovieViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/30.
//

import UIKit

import RxSwift
import RxCocoa

final class MovieViewController: UIViewController {
    
    // MARK: - Property
    
    private let disposeBag = DisposeBag()
    private let movieViewModel = MovieViewModel()
    
    // MARK: - UI Component
    
    private let movieView = MovieView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = movieView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        setupRegister()
        bindViewModel()
    }
}

private extension MovieViewController {
    func setupDelegate() {
        movieView.delegate = self
        movieView.headerCollectionView.topdelegate = self
        // movieView.movieTableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    func setupRegister() {
        movieView.movieTableView.register(UINib(nibName: MovieTableViewCell.className, bundle: nil), forCellReuseIdentifier: MovieTableViewCell.className)
    }
    
    func bindViewModel() {
        movieViewModel.outputs.dailyRankData
            .filter { !$0.isEmpty }
            .observe(on: MainScheduler.instance)
            .bind(to: movieView.movieTableView.rx
                .items(cellIdentifier: MovieTableViewCell.className,
                       cellType: MovieTableViewCell.self)) { (_, model, cell) in
                
                cell.configureCell(data: model)
            }
                       .disposed(by: disposeBag)
        
    }
}
// MARK: - CollectionView

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

// MARK: - TableView

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension MovieViewController: MovieViewDelegate {
    func didSelectDate(_ date: String) {
        movieViewModel.inputs.getDailyRankDTO(for: date)
    }
}
