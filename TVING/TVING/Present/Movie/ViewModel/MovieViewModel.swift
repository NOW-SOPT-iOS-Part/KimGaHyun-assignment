//
//  MovieViewModel.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/06/03.
//

import UIKit

import Moya
import RxSwift
import RxCocoa


protocol MovieViewModelInputs {
    func getDailyRankDTO(for date: String)
}

protocol MovieViewModelOutputs {
    var dailyRankData: BehaviorSubject<[MovieDTO]> { get }
}

protocol MovieViewModelType {
    var inputs: MovieViewModelInputs { get }
    var outputs: MovieViewModelOutputs { get }
}

final class MovieViewModel: MovieViewModelType, MovieViewModelInputs, MovieViewModelOutputs {
    
    private let movieView = MovieView()
    
    var dailyRankData: BehaviorSubject<[MovieDTO]>
    var dailyBoxOfficeList: [MovieDTO]?
    
    private let disposeBag = DisposeBag()
    
    init() {
        self.dailyRankData = BehaviorSubject(value: [])
    }
    
    func getDailyRankDTO(for date: String) {
        MovieService.shared.getDailyRank(targetDate: date) { [weak self] response in
            switch response {
            case .success(let data):
                guard let data = data as? [MovieDTO] else { return }
                self?.dailyRankData.onNext(data)
                self?.dailyBoxOfficeList = data
                self?.movieView.movieTableView.reloadData()
            case .requestErr:
                print("요청 오류입니다")
            case .decodedErr:
                print("디코딩 오류입니다")
            case .pathErr:
                print("경로 오류입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
    
    var inputs: MovieViewModelInputs { return self }
    var outputs: MovieViewModelOutputs { return self }
}
