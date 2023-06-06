//
//  ResponseFilm.swift
//  NetflixProjet
//
//  Created by digital on 05/06/2023.
//

import Foundation

struct ResponseFilm:Decodable{
    let title:String
    let overview:String
    let genres: [ResponseCategory]?
    let poster_path:String
    let release_date:String
    let runtime:Int
    let id:Int
    let videos:ResponseVideo?
    
    init(title: String, overview: String, genres: [ResponseCategory]?, poster_path: String, release_date: String, runtime: Int, id: Int, videos: ResponseVideo?) {
        self.title = title
        self.overview = overview
        self.genres = genres
        self.poster_path = poster_path
        self.release_date = release_date
        self.runtime = runtime
        self.id = id
        self.videos = videos
    }
}

struct DataFilmList:Decodable, Hashable{
    let id:Int?
    let adult:Bool?
    let release_date:String?
    let poster_path:String?
    let title:String?
    let overview:String?
    
    init(id: Int?, adult: Bool?, release_date: String?, poster_path: String?, title: String?, overview: String?) {
        self.id = id
        self.adult = adult
        self.release_date = release_date
        self.poster_path = poster_path
        self.title = title
        self.overview = overview
    }
}

struct DataFilmResponse: Decodable{
    let results:[DataFilmList]?
    
    init(results: [DataFilmList]?) {
        self.results = results
    }
}
