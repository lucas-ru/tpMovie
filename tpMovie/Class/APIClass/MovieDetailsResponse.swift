//
//  MovieDetailsResponse.swift
//  tpMovie
//
//  Created by lucas on 18/05/2021.
//

import Foundation

struct MovieDetailsResponse: Decodable {
    let id: Int?
    let backdropPath: String?
    let overview: String?
    let tagline: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let runtime: Int?
    let genres: [Genre]?

    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case overview
        case releaseDate = "release_date"
        case title
        case tagline
        case video
        case runtime
        case genres
    }
}
