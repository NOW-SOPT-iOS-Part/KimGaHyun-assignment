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
}

struct MainMovieList {
    let mainMovieImg: UIImage
}

struct MovieList {
    let movieImg: UIImage
    let movieTitle: String
}


extension MainMovieList {
    static func dummy() -> [MainMovieList] {
        return [
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
