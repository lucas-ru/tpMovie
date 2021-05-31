//
//  MovieResponse.swift
//  tpMovie
//
//  Created by lucas on 18/05/2021.
//

import Foundation

struct MovieListResponse: Decodable {
    let page, totalResults, totalPages: Int?
    let results: [MovieResponse]?

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    func transformToMovieArray() -> [Movie] {
        guard let results = self.results else {
            return []
        }
        return results.compactMap { movieReponse -> Movie? in
            Movie(from: movieReponse)
        }
        
    }
    
}

struct MovieResponse: Decodable {
    let id: Int?
    let backdropPath: String?
    let genres: [Int]?
    let title: String?
    let overview: String?
    let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case genres = "genre_ids"
        case title
        case overview
        case releaseDate = "release_date"
    }
}
