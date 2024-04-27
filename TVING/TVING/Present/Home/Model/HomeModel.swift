//
//  HomeModel.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/22.
//

import UIKit

struct HomeModel {
    let mainMovieList: [MainMovieList]
    let movieList: [MovieList]
    let liveChannelList: [LiveChannelList]
}

struct MainMovieList {
    let mainMovieImg: UIImage
}

struct MovieList {
    let movieImg: UIImage
    let movieTitle: String
}

struct LiveChannelList {
    let channelImg: UIImage
    let ranking: String
    let entertain: String
    let programTitle: String
    let percent: String
}


extension MainMovieList {
    static func dummy() -> [MainMovieList] {
        return [
            MainMovieList(mainMovieImg: .imgMovie5),
            MainMovieList(mainMovieImg: .imgMovie5),
            MainMovieList(mainMovieImg: .imgMovie5),
            MainMovieList(mainMovieImg: .imgMovie5),
            MainMovieList(mainMovieImg: .imgMovie5),
            MainMovieList(mainMovieImg: .imgMovie5)
        ]
    }
}
extension MovieList {
    static func dummy() -> [MovieList] {
        return [
            MovieList(movieImg: .imgMovie1, movieTitle: "시그널"),
            MovieList(movieImg: .imgMovie2, movieTitle: "해리포터와 마법사의 돌"),
            MovieList(movieImg: .imgMovie3, movieTitle: "반지의 제왕"),
            MovieList(movieImg: .imgMovie4, movieTitle: "스즈메의 문단속"),
            MovieList(movieImg: .imgMovie5, movieTitle: "너의 이름은")
        ]
    }
}

extension LiveChannelList {
    static func dummy() -> [LiveChannelList] {
        return [
            LiveChannelList(channelImg: .imgLive1, ranking: "1", entertain: "Mnet", programTitle: "보이즈 플래닛 12화", percent: "80.0%"),
            LiveChannelList(channelImg: .imgLive2, ranking: "2", entertain: "Mnet", programTitle: "하트시그널 4화", percent: "24.1%"),
            LiveChannelList(channelImg: .imgLive2, ranking: "3", entertain: "Mnet", programTitle: "류희재 VLOG", percent: "11.5%")
        ]
    }
}
