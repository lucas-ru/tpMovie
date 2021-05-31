//
//  CategoryResponse.swift
//  tpMovie
//
//  Created by lucas on 18/05/2021.
//

import Foundation

struct CategoryResponse: Decodable {
    let genres: [Genre]?
    
    func transformToCategoryArray() -> [Category] {
        guard let genres = self.genres else {
            return []
        }
        return genres.compactMap { genre -> Category? in
            Category(from: genre)
        }    }
}

struct Genre: Decodable {
    let id: Int?
    let name: String?
}
