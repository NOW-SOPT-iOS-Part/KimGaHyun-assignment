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
    private let topCollectionView = TopCollectionView()

    private let pageReusableView = PageReusableCollectionView()
    
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setRegister()
        reloadCollectionView(isHidden: true)
    }
}


private extension HomeViewController {
    func setDelegate() {
        topCollectionView.parentViewController = self
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
            $0.register(BaseballCollectionViewCell.self,
                        forCellWithReuseIdentifier: BaseballCollectionViewCell.className)
            
            // header
            $0.register(HomeHeaderCollectionView.self,
                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                        withReuseIdentifier: HomeHeaderCollectionView.className)
            // footer
            $0.register(EmptyReusableCollectionView.self,
                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                        withReuseIdentifier: EmptyReusableCollectionView.className)
            $0.register(PageReusableCollectionView.self,
                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                        withReuseIdentifier: PageReusableCollectionView.className)
        }
    }
    
    func reloadCollectionView(isHidden: Bool) {
        homeView.collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let pageReusableView = collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionFooter, at: indexPath) as? PageReusableCollectionView else {
            return
        }
        pageReusableView.pageControl.currentPage = indexPath.section
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 4
        case 2:
            return 3
        case 3:
            return 4
        case 4:
            return 2
        case 5:
            return 4
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
            
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseballCollectionViewCell.className,
                                                                for: indexPath) as? BaseballCollectionViewCell else { return UICollectionViewCell() }
            return cell
        default:
            guard let cell = homeView.collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.className,
                                                                         for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
            cell.bindData(forModel: movieData[indexPath.item])
            return cell
            
        }
    }
    
    // Header
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: HomeHeaderCollectionView.className,
                                                                               for: indexPath) as? HomeHeaderCollectionView else { return UICollectionReusableView()}
            switch indexPath.section {
            case 1:
                header.configureHeader(forTitle: "티빙에서 꼭 봐야하는 콘텐츠")
                return header
            case 2:
                header.configureHeader(forTitle: "인기 LIVE 채널")
                return header
            case 3:
                header.configureHeader(forTitle: "1화 무료! 파라마운트+ 인기시리즈")
                return header
            case 4:
                header.configureHeader(forTitle: "")
                header.resetButton()
                return header
            case 5:
                header.configureHeader(forTitle: "마술보다 더 신비로운 영화(신비로운 영화사전님)")
                return header
            default: break
            }
            return header
        case UICollectionView.elementKindSectionFooter:
            switch indexPath.section {
            case 0:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                   withReuseIdentifier: PageReusableCollectionView.className,
                                                                                   for: indexPath) as? PageReusableCollectionView else { return UICollectionReusableView() }
                return footer
            default:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                   withReuseIdentifier: EmptyReusableCollectionView.className,
                                                                                   for: indexPath) as? EmptyReusableCollectionView else { return UICollectionReusableView() }
                return footer
            }
        default:
            return UICollectionReusableView()
        }
    }
    
    // Header 크기 지정
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 45)
    }
    // Footer 크기 지정
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 40)
    }
}

//extension HomeViewController {
//    func cellSelected(at indexPath: IndexPath) {
//            // 선택된 셀에 따라 다른 화면으로 이동
//            switch indexPath.row {
//            case 0:
//                print("CELL 1 CLICKED")
//                let vc = HomeViewController()
//                navigationController?.pushViewController(vc, animated: true)
//            case 1:
//                print("CELL 2 CLICKED")
//                let vc = LoginViewController()
//                navigationController?.pushViewController(vc, animated: true)
//            case 2:
//                let vc = UIViewController()
//                navigationController?.pushViewController(vc, animated: true)
//            case 3:
//                let vc = UIViewController()
//                navigationController?.pushViewController(vc, animated: true)
//            case 4:
//                let vc = UIViewController()
//                navigationController?.pushViewController(vc, animated: true)
//            default:
//                break
//            }
//    }}
