//
//  TMDBRequest.swift
//  Movie Application
//
//  Created by 김성률 on 6/27/24.
//

import Foundation
import Alamofire

enum APIRequest {
    
    case firstInfo
    case secondInfo(id: Int)
    
    case search(query: String, page: Int)
    
    case recommand(query: String)
    case similar(query: String)
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var endpoint: URL {
        switch self {
        
        case .firstInfo:
            return URL(string: baseURL + "trending/movie/week?")!
            
        case .secondInfo(let id):
            return URL(string: baseURL + "movie/\(id)/credits?api_key=\(APIkey.id)")!
            
        case .search(let movieName, let page):
            return URL(string: baseURL + "search/movie?query=\(movieName)&page=\(page)")!
        
        case .recommand(let movieID):
            return URL(string: baseURL + "movie/\(movieID)/recommendations")!
            
        case .similar(let movieID):
            return URL(string: baseURL + "movie/\(movieID)/similar")!

        }
    }
    
    var header: HTTPHeaders {
        return [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWZlZDlhZDI4M2YwNmQ2OGM5MmQ0OGU5YjY5MzM1NSIsInN1YiI6IjY2NjU5YWJmYTJiNTYwOGZiOTEzODA3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DsjHLjeT2yEYwT6Jy_u8IZip2TJuqLKbigAjKaiz0jo",
            "accept": "application/json"
        ]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
}
