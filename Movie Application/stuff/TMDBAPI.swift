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
