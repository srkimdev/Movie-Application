//
//  movieStruct.swift
//  Movie Application
//
//  Created by 김성률 on 6/10/24.
//

import UIKit

struct weekMovie: Decodable {
    
    let results: [weekMovieInfo]
    
}

struct weekMovieInfo: Decodable {
    
    let backdrop_path: String
    let id: Int
    let overview: String
    let poster_path: String
    let title: String
    let genre_ids: [Int]
    let release_date: String
    let vote_average: Double
    
}

struct Genre {
    
    static let genres: [Int: String] = [
        28: "#Action",
        12: "#Adventure",
        16: "#Animation",
        35: "#Comedy",
        80: "#Crime",
        99: "#Documentary",
        18: "#Drama",
        10751: "#Family",
        14: "#Fantasy",
        36: "#History",
        27: "#Horror",
        10402: "#Music",
        9648: "#Mystery",
        10749: "#Romance",
        878: "#Science Fiction",
        10770: "#TV Movie",
        53: "#Thriller",
        10752: "#War",
        37: "#Western"
    ]
    
}

struct detailMovie: Decodable {
    
    let cast: [detailMovieInfo]
    
}

struct detailMovieInfo: Decodable {
    
    let name: String
    let profile_path: String?
    let character: String
    
}

struct MovieSearch: Decodable {
    
    var total_pages: Int
    var results: [MoviePoster]
    
}

struct MoviePoster: Decodable {
    
    let poster_path: String?
    let id: Int
    let title: String
    
}

struct RecommandMovie: Decodable, Identifiable {
    
    var id: String
    let results: [RecommandKind]
    
}

struct RecommandKind: Decodable {
    let poster_path: String?
}

struct TotalPoster: Decodable {
    let backdrops: [posterID]
}

struct posterID: Decodable {
    let file_path: String?
}

protocol Identifiable {
    var id: String { get }
}

struct titleID {
    
    let title: String
    let id: Int
    
}



