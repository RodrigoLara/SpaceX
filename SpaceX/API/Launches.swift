//
//  Launches.swift
//  SpaceX
//
//  Created by Rodrigo Lara on 09/08/22.
//

import Foundation

class Launches {
    var id: String = ""
    var name: String = ""
    var details: String = ""
    var date_utc: String = ""
    var small: String = ""
    var large: String = ""
    
    init(_ dic: NSDictionary) {
        self.id         = dic["id"] as? String ?? ""
        self.name       = dic["name"] as? String ?? ""
        self.details    = dic["details"] as? String ?? ""
        self.date_utc   = dic["date_utc"] as? String ?? ""
        
        if let links = dic["links"] as? NSDictionary,
            let patch = links["patch"] as? NSDictionary {
            self.small   = patch["small"] as? String ?? ""
            self.large   = patch["large"] as? String ?? ""
        }
    }
    
    class func allData(_ jsonArray: NSArray) -> [Launches] {
        var launches: [Launches] = []
        
        for object in jsonArray {
            if let dic = object as? NSDictionary {
                launches.append(Launches(dic))
                
                if launches.count == 10 { break }
            }
        }
        
        return launches
    }
}
