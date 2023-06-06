//
//  ResponseCategory.swift
//  TP1
//
//  Created by digital on 05/06/2023.
//

import Foundation

struct ResponseCategory:Decodable, Hashable {
    let id: Int?
    let name: String?
    
    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }

}
struct CategoryResponse:Decodable {
    let genres:[ResponseCategory]?
}
