//
//  MovieViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/30.
//

import UIKit

final class MovieViewController: UIViewController {
    
    // MARK: - Property
    
    private var dailyBoxOfficeList: [DailyBoxOfficeList]?
    
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
    }
}

private extension MovieViewController {
    func setupDelegate() {
        movieView.delegate = self
        movieView.headerCollectionView.topdelegate = self
        movieView.movieTableView.delegate = self
        movieView.movieTableView.dataSource = self
    }
    
    func setupRegister() {
        movieView.movieTableView.register(MovieTableViewCell.self,
                                          forCellReuseIdentifier: MovieTableViewCell.className)
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

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyBoxOfficeList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.className, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let data = dailyBoxOfficeList?[indexPath.row]
        cell.configureCell(data)
        return cell
    }
}

// MARK: - MovieViewDelegate

extension MovieViewController: MovieViewDelegate {
    func didSelectDate(_ date: String) {
        getDailyRank(for: date)
    }
}

// MARK: - Network

extension MovieViewController {
    func getDailyRank(for date: String) {
        MovieService.shared.getDailyRank(targetDate: date) { [weak self] response in
            switch response {
            case .success(let data):
                guard let data = data as? DailyBoxOffice else { return }
                self?.dailyBoxOfficeList = data.boxOfficeResult.dailyBoxOfficeList
                // 데이터를 받은 후에 databind 호출
                if let dataList = self?.dailyBoxOfficeList {
                    self?.movieView.databind(dataList)
                }
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("경로 오류 입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
}
