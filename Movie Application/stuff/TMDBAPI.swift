//
//  TMDBAPI.swift
//  Movie Application
//
//  Created by 김성률 on 6/26/24.
//

import UIKit
import Alamofire

enum APIRequest {
    
    case recommand(query: String)
    case similar(query: String)
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var endpoint: URL {
        switch self {
            
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

class TMDBAPI {
    
    static let shared = TMDBAPI()
    
    private init() {}
    
    func communicationRe(api: APIRequest, completionHandler: @escaping ([RecommandKind]) -> Void, errorHandler: @escaping (String) -> Void) {
        
        AF.request(api.endpoint, method: api.method, headers: api.header).responseDecodable(of: RecommandMovie.self) { response in
            
            switch response.result {
                
            case .success(let value):
                
                completionHandler(value.results!)
            
            case .failure(let error):
                
                errorHandler("잠시 후 다시 시도해주세요.")

            }
        }
        
    }
    
}
