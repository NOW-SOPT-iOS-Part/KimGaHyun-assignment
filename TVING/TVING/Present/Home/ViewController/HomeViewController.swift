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
        
        setupNavigationBar()
        setAddTarget()
        setDelegate()
        setRegister()
        reloadCollectionView(isHidden: true)
    }
    
}


private extension HomeViewController {
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
            $0.register(BaseballCollectionViewCell.self,
                        forCellWithReuseIdentifier: BaseballCollectionViewCell.className)
            
            // header
            $0.register(HomeHeaderCollectionView.self,
                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                        withReuseIdentifier: HomeHeaderCollectionView.className)
            $0.register(MainStickyHeaderCollectionReusableView.self,
                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                        withReuseIdentifier: MainStickyHeaderCollectionReusableView.className)
            // footer
            $0.register(EmptyReusableCollectionView.self,
                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                        withReuseIdentifier: EmptyReusableCollectionView.className)
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
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
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
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: HomeHeaderCollectionView.className,
                                                                               for: indexPath) as? HomeHeaderCollectionView else { return UICollectionReusableView()}
            guard let topHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                                  withReuseIdentifier: MainStickyHeaderCollectionReusableView.className,
                                                                                  for: indexPath) as? MainStickyHeaderCollectionReusableView
            else { return MainStickyHeaderCollectionReusableView() }
            switch indexPath.section {
            case 0:
                topHeader.configure()
                return topHeader
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
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: EmptyReusableCollectionView.className,
                                                                               for: indexPath) as? EmptyReusableCollectionView else { return UICollectionReusableView() }
            return footer
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
        updateHeaderView(inSection: 0)
    }
    
    private func updateHeaderView(inSection section: Int) {
        //헤더 가져오기
        let headerView = homeView.collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader).first as? MainStickyHeaderCollectionReusableView
        
        // 스크롤 오프셋
        let yOffset = homeView.collectionView.contentOffset.y
        
        // 헤더의 y 좌표 업데이트
        let indexPathsForVisibleItems = homeView.collectionView.indexPathsForVisibleItems
        let firstVisibleSection = indexPathsForVisibleItems.map({ $0.section }).min()
        if firstVisibleSection == section {
            print("Y좌표: ", yOffset)
            headerView?.frame.origin.y = max(0, yOffset)
            
        }
    }
}
