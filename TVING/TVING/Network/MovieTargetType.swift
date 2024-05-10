//
//  UserTargetType.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/05/07.
//

import Foundation

import Moya

enum MovieTargetType {
    case getdailyRank(targetDate: String)
}

extension MovieTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getdailyRank:
            return "/boxoffice/searchDailyBoxOfficeList.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getdailyRank:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getdailyRank(targetDate: let date):
            return .requestParameters(parameters: ["key" : Config.apiKey,
                                                   "targetDt" : date],
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getdailyRank:
            return .none
        }
    }
}

