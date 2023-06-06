//
//  ResponseVideo.swift
//  TP1
//
//  Created by digital on 05/06/2023.
//

import Foundation

struct  VideoType: Decodable {
    let key:String?
    let type:String?
    
    init(key: String?, type: String?) {
        self.key = key
        self.type = type
    }
}

struct ResponseVideo: Decodable {
    let results:[VideoType]?
    
    init(results: [VideoType]?) {
        self.results = results
    }
}


