//
//  Movie.swift
//  tpMovie
//
//  Created by lucas on 18/05/2021.
//

import Foundation

struct Movie {
    var id: Int
    var title: String
    var subtitle: String?
    var year: Int?
    var duration: Int?
    var categories: [String]?
    var synopsis: String?
    var imageUrl: String?
    var posterUrl: String?
    
    init?(from movieResponse: MovieResponse) {
        guard let id = movieResponse.id, let title = movieResponse.title, let year = movieResponse.releaseDate else {
            return nil
        }
        self.id = id
        self.title = title
        self.year = Int(String(year.prefix(4)))
        self.synopsis = movieResponse.overview
        if let backdrop = movieResponse.backdropPath {
            self.imageUrl = APIManager.shared.imageBaseUrl + "w500" + backdrop
        }
    }
    
    init?(from movieDetailsResponse: MovieDetailsResponse) {
        guard let id = movieDetailsResponse.id,
            let title = movieDetailsResponse.title,
            let year = movieDetailsResponse.releaseDate,
            let poster = movieDetailsResponse.posterPath else {
            return nil
        }
        self.id = id
        self.title = title
        self.subtitle = movieDetailsResponse.tagline
        self.year = Int(String(year.prefix(4)))
        self.synopsis = movieDetailsResponse.overview
        if let backdrop = movieDetailsResponse.backdropPath {
            self.imageUrl = APIManager.shared.imageBaseUrl + "w500" + backdrop
        }
        self.posterUrl = APIManager.shared.imageBaseUrl + "w200" + poster
        self.duration = movieDetailsResponse.runtime
        self.categories = movieDetailsResponse.genres?.compactMap({ genre -> String? in
            guard let name = genre.name else {
                return nil
            }
            return name
        })
    }
    
    func getCategoriesAsString() -> String {
        guard let categories = self.categories else {
            return "-"
        }
        return categories.joined(separator: ", ")
     }
    
    func getDurationAsString() -> String {
        guard let duration = self.duration else {
            return "-"
        }
        return "\(duration) min"
    }
    
    func getImageUrl() -> URL? {
        guard let imageUrl = self.imageUrl else {
            return nil
        }
        return URL(string: imageUrl)
    }
    
    func getPosterUrl() -> URL? {
        guard let posterUrl = self.posterUrl else {
            return nil
        }
        return URL(string: posterUrl)
    }
    
}
