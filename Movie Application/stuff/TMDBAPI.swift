//
//  TMDBAPI.swift
//  Movie Application
//
//  Created by 김성률 on 6/26/24.
//

import UIKit
import Alamofire

class TMDBAPI {
    
    static let shared = TMDBAPI()
    
    private init() {}

    func communication<T: Decodable>(api: APIRequest, model: T.Type, completionHandler: @escaping (T?, String?) -> Void) {
        
        AF.request(api.endpoint, method: api.method, headers: api.header).responseDecodable(of: T.self) { response in
            
            switch response.result {
                
            case .success(let value):
                
                completionHandler(value, nil)
                print(value)
            
            case .failure(let error):
                
                completionHandler(nil, "잠시 후 ")

            }
        }
        
    }
    
}


//class TMDBAPI {
//    
//    static let shared = TMDBAPI()
//    
//    private init() {}
//    
//    // 네트워크 요청 모델: router pattern
//    // 프로토콜로 만들어 놓은것 -> moya
//
//    typealias CompletionHandler = ([PosterPath]?, String?) -> Void
//    // errorHandler를 이용해서 통신이 안됐을 때 에러메세지를 띄어줄 수 있다.
//    // (completionHandler: @escaping ([PosterPath]?, String?) -> Void
//    // 제네릭, 메타타입 적용 -> 나중에
////api: TMDBRequest,completionHandler: @escaping ([PosterPath]) -> Void, errorHandler: @escaping (String) -> Void
//    
//    func trending<T: Decodable>(api: TMDBRequest, model: T.Type, completionHandler: @escaping (T?, String?) -> Void) {
//
//        AF.request(api.endpoint, method: api.method, parameters: api.parameter, encoding: URLEncoding(destination: .queryString), headers: api.header).responseDecodable(of: T.self) { response in
//            
//            switch response.result {
//                
//            case .success(let value):
//                
////                completionHandler(value.results!)
////                completionHandler(value.results, nil)
//                 completionHandler(value, nil)
//            
//            case .failure(let error):
//                print(error)
////                errorHandler("잠시 후 다시 시도해주세요.")
////                completionHandler(nil, "잠시 후 다시 시도해주세요.")
//                 completionHandler(nil, "")
//            }
//        }
//
//    }
//    
//    func moviePoster() {
//
//        let url = "https://api.themoviedb.org/3/movie/10300/images"
//
//        let header: HTTPHeaders = [
//            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWZlZDlhZDI4M2YwNmQ2OGM5MmQ0OGU5YjY5MzM1NSIsInN1YiI6IjY2NjU5YWJmYTJiNTYwOGZiOTEzODA3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DsjHLjeT2yEYwT6Jy_u8IZip2TJuqLKbigAjKaiz0jo",
//            "accept": "application/json"
//        ]
//
//        AF.request(url, method: .get, headers: header).responseDecodable(of: MovieAPI.self) { response in
//
//            switch response.result {
//
////            case .success(let value):
//
////                completionHandler(value.results!)
//
//            case .failure(let error):
//                print(error)
//            }
//        }
//
//    }
//    
//    func movieSearch() {
//
//        let url = "https://api.themoviedb.org/3/search/movie?query=해리포터"
//
//        let header: HTTPHeaders = [
//            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWZlZDlhZDI4M2YwNmQ2OGM5MmQ0OGU5YjY5MzM1NSIsInN1YiI6IjY2NjU5YWJmYTJiNTYwOGZiOTEzODA3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DsjHLjeT2yEYwT6Jy_u8IZip2TJuqLKbigAjKaiz0jo",
//            "accept": "application/json"
//        ]
//
//        AF.request(url, method: .get, headers: header).responseDecodable(of: MovieAPI.self) { response in
//
//            switch response.result {
//
//            case .success(let value):
//
////                completionHandler(value.results!)
//
//            case .failure(let error):
//                print(error)
//            }
//        }
//
//    }
//    
//}
//
//struct MovieAPI: Decodable {
//    
//    let results: [PosterPath]?
//    
//}
//
//struct PosterPath: Decodable {
//    
//    let poster_path: String?
//    
//}

