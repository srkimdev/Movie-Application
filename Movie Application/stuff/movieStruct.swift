//
//  movieStruct.swift
//  Movie Application
//
//  Created by 김성률 on 6/10/24.
//

import UIKit

struct MovieTotal: Decodable {
    
    let results: [MovieInfo]
    
}

struct MovieInfo: Decodable {
    
    let id: Int
    let poster_path: String
    let title: String
    let genre_ids: [Int]
    let release_date: String
    let vote_average: Double
    
}

struct MovieTotal2: Decodable {
    
    let cast: [MovieInfo2]
    
}

struct MovieInfo2: Decodable {
    
    let character: String
    
}




