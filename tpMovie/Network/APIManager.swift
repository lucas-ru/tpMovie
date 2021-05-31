//
//  APIManager.swift
//  tpMovie
//
//  Created by lucas on 18/05/2021.
//

import Foundation

struct APIManager {
    static var shared = APIManager()
    
    let baseUrl = "https://api.themoviedb.org/3"
    let apiKey = "7e927ba78fb12066bc0b46efc2217f38"
    let imageBaseUrl = "https://image.tmdb.org/t/p/"
    
    /**
        Creation of the url according to the type of data to recover and to the query params
     */
    func buildUrl(path: Type, queryParams: [URLQueryItem]? = nil) -> URLComponents? {
        var url = URLComponents(string: "\(self.baseUrl)\(path.rawValue)")
        url?.queryItems = [
            URLQueryItem(name: "api_key", value: self.apiKey),
            URLQueryItem(name: "language", value: "fr-FR")
        ]
        if let params = queryParams {
            url?.queryItems! += params
        }
        return url
    }
}

/**
    List of the different data to recover
 */
enum Type: String {
    case list = "/discover/movie"
    case details = "/movie/"
    case categories = "/genre/movie/list"
}
