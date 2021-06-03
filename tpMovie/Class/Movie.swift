//
//  Movie.swift
//  tpMovie
//
//  Created by lucas on 18/05/2021.
//

import Foundation

struct Movie {
    var idMovie: Int
    var titleMovie: String
    var subtitleMovie: String?
    var synopsisMovie: String?
    var TypeCatMovie: [String]?
    var durationMovie: Int?
    var yearMovie: Int?
    var imageUrlMovie: String?
    
    init?(from movieResponse: MovieResponse) {
        guard let id = movieResponse.id,
              let title = movieResponse.title,
              let year = movieResponse.releaseDate else {
            return nil
                
            }
        self.idMovie = id
        self.titleMovie = title
        self.yearMovie = Int(String(year.prefix(4)))
        self.synopsisMovie = movieResponse.overview
        if let backdrop = movieResponse.backdropPath {
            self.imageUrlMovie = APIManager.shared.imageBaseUrl + "w500" + backdrop
        }
        
    }
    
    init?(from movieDetailsResponse: MovieDetailsResponse) {
        guard let id = movieDetailsResponse.id,
            let title = movieDetailsResponse.title,
            let year = movieDetailsResponse.releaseDate else {
            return nil
            
        }
        self.idMovie = id
        self.titleMovie = title
        self.subtitleMovie = movieDetailsResponse.tagline
        self.yearMovie = Int(String(year.prefix(4)))
        self.synopsisMovie = movieDetailsResponse.overview
        if let backdrop = movieDetailsResponse.backdropPath {
            self.imageUrlMovie = APIManager.shared.imageBaseUrl + "w500" + backdrop
        }
        self.durationMovie = movieDetailsResponse.runtime
        self.TypeCatMovie = movieDetailsResponse.genres?.compactMap({ genre -> String? in
            guard let name = genre.name else {
                return nil
            }
            return name
        })
    }
    
    func getTypeCatAsString() -> String {
        guard let categoriesMovie = self.TypeCatMovie else {
            return "-"
        }
        return categoriesMovie.joined(separator: ", ")
     }
    
    func getDurationAsString() -> String {
        guard let durationMovie = self.durationMovie else {
            return "-"
        }
        return "\(durationMovie) min"
    }
    
    func getImageUrl() -> URL? {
        guard let imageUrlMovie = self.imageUrlMovie else {
            return nil
        }
        return URL(string: imageUrlMovie)
    }
    
}


