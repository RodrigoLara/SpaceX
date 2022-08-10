//
//  APIRequest.swift
//  SpaceX
//
//  Created by Rodrigo Lara on 09/08/22.
//

import Foundation
import Alamofire

class APIRest {
    static let spaceEndpoint = "https://api.spacexdata.com/v4/"
    
    static func launches(completion: @escaping(AFDataResponse<Any>) -> Void) {
        let endpoint = "launches"
        
        AF.request("\(spaceEndpoint)\(endpoint)").responseJSON { response in
            completion(response)
        }
    }
    
    static func launchById(id: String, completion: @escaping(AFDataResponse<Any>) -> Void) {
        let endpoint = "launches/\(id)"
        
        AF.request("\(spaceEndpoint)\(endpoint)").responseJSON { response in
            completion(response)
        }
    }
}
