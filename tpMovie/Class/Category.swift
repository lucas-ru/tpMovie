//
//  Category.swift
//  tpMovie
//
//  Created by lucas on 18/05/2021.
//

import Foundation

struct Category {
    let id: Int
    let name: String
    
    init?(from genre: Genre) {
        guard let id = genre.id, let name = genre.name else {
            return nil
        }
        self.id = id
        self.name = name
    }
}
