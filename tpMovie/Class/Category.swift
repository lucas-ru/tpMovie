//
//  Category.swift
//  tpMovie
//
//  Created by lucas on 18/05/2021.
//

import Foundation

struct Category {
    let idCategory: Int
    let nameCategory: String
    
    init?(from genre: Genre) {
        guard let id = genre.id, let name = genre.name else {
            return nil
        }
        self.idCategory = id
        self.nameCategory = name
    }
}
