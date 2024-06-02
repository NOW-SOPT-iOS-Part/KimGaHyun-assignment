//
//  UserService.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/05/07.
//

import Foundation

import Moya

final class MovieService {
    // 싱글톤 객체 선언
    static let shared = MovieService()
    private var movieProvider = MoyaProvider<MovieTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension MovieService {
    
    func getDailyRank(targetDate: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        movieProvider.request(.getdailyRank(targetDate: targetDate)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode,
                                                     data,
                                                     DailyBoxOffice.self)
                completion(networkResult)
                
            case.failure:
                completion(.networkFail)
            }
        }
    }
    
    //서버통신 자체는 성공을 해도 응답 실패로 우리가 원하는 데이터를 받지 못한 상태일 떄를 분기처리하기 위한 메소드
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    // 통신이 성공하고 원하는 데이터가 올바르게 들어왔을 때 데이터 처리를 위한 메소드
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
            return .pathErr }
        return .success(decodedData as Any)
    }
}
