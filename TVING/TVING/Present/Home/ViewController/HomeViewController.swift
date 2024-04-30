//
//  HomeViewController.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/22.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController  {
    
    // MARK: - Properties
    
    private var mainMovieData = MainMovieList.dummy()
    private var movieData = MovieList.dummy()
    private var liveChannelData = LiveChannelList.dummy()
    
    // MARK: - UI Components
    
    private let homeView = HomeView()
    let topCollectionView = TopCollectionView()
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
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        homeView.headerCollectionView.topdelegate = self
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
        if let footers = collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionFooter) as? [PageReusableCollectionView], let footer = footers.first {
            let currentPageIndex = indexPath.row
            footer.setupPageIndex(forIndex: currentPageIndex)
        }
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
            pageReusableView.pageControl.currentPage = indexPath.item
            cell.bindData(forModel: mainMovieData[indexPath.item])
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
            // header 재사용 - Title만 변경
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

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let navigationBarHidden = scrollView.contentOffset.y > 0
        self.navigationController?.setNavigationBarHidden(navigationBarHidden, animated: false)
        if navigationBarHidden {
            topCollectionView.backgroundColor = .tvingBlack
        } else {
            topCollectionView.backgroundColor = .clear
        }
    }
}

extension HomeViewController: TopCollectionViewDelegate {
    func navigateToScreen(vc: UIViewController) {
        let vc = vc
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    func topCollectionView(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let homeVC = HomeViewController()
            navigateToScreen(vc: homeVC)
        case 1:
            loadView()
            let liveVC = LiveViewController()
            navigateToScreen(vc: liveVC)
        case 2:
            let movieVC = MovieViewController()
            navigateToScreen(vc: movieVC)
        default:
            break
        }
    }
}
