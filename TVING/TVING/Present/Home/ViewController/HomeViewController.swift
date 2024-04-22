//
//  HomeViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/22.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var mainMovieData = MainMovieList.dummy()
    private var movieData = MovieList.dummy()
    private var liveChannelData = LiveChannelList.dummy()
    
    // MARK: - UI Components
    
    private let homeView = HomeView()
    
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
        setDelegate()
        setRegister()
        reloadCollectionView(isHidden: true)
    }
}


private extension HomeViewController {
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
    
    func setRegister() {
        let homeCollectionView = homeView.collectionView
        homeCollectionView.alwaysBounceVertical = true
        
        homeCollectionView.do {
            $0.register(MainCollectionViewCell.self,
                        forCellWithReuseIdentifier: MainCollectionViewCell.className)
            $0.register(MovieCollectionViewCell.self,
                        forCellWithReuseIdentifier: MovieCollectionViewCell.className)
            $0.register(PopularLiveCollectionViewCell.self,
                        forCellWithReuseIdentifier: PopularLiveCollectionViewCell.className)
            
            // header
            $0.register(HomeHeaderCollectionView.self,
                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                        withReuseIdentifier: HomeHeaderCollectionView.className)
        }
    }
    
    func reloadCollectionView(isHidden: Bool) {
        homeView.collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
            return 3
        case 3:
            return 5
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.className,
                                                                for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
            
            cell.bindData(forModel: mainMovieData[indexPath.item])
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.className,
                                                                         for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
            cell.bindData(forModel: movieData[indexPath.item])
            return cell
        
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularLiveCollectionViewCell.className,
                                                                         for: indexPath) as? PopularLiveCollectionViewCell else { return UICollectionViewCell() }
            cell.bindData(forModel: liveChannelData[indexPath.item])
            return cell
            
        default:
            guard let cell = homeView.collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier,
                                                                         for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
            cell.bindData(forModel: movieData[indexPath.item])
            return cell
            
        }
    }
    
    // Header
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: HomeHeaderCollectionView.className,
                                                                           for: indexPath) as? HomeHeaderCollectionView else { return UICollectionReusableView() }
        switch indexPath.section {
        case 1:
            header.configureHeader(forTitle: "티빙에서 꼭 봐야하는 콘텐츠")
        case 2:
            header.configureHeader(forTitle: "인기 LIVE 채널")
        case 3:
            header.configureHeader(forTitle: "1화 무료! 파라마운트+ 인기시리즈")
        case 5:
            header.configureHeader(forTitle: "마술보다 더 신비로운 영화(신비로운 영화사전님)")
        default: break
        }
        return header
    }
    
    // Header 크기 지정
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 45)
    }
}



