//
//  MoviesRequest.swift
//  tpMovie
//
//  Created by lucas on 18/05/2021.
//

import Foundation

struct MoviesRequest {
    /**
        Request to the API to get a movie list
     */
    func getMoviesList(page: Int = 1, categoryId: Int? = nil, completion: @escaping ((MovieListResponse?) -> ())) {
        var params: [URLQueryItem] = []
        params.append(URLQueryItem(name: "page", value: "\(page)"))
        if let category = categoryId {
            params.append(URLQueryItem(name: "with_genres", value: "\(category)"))
        }
        
        let movUrl = APIManager.shared.buildUrl(path: Type.list, queryParams: params)
        if let url = movUrl?.url {
            NetworkManager.shared.fetchData(url) { data in
                completion(try? JSONDecoder().decode(MovieListResponse.self, from: data))
            }
        }
    }
    
    /**
        Request to the API to get the details of a specific movie
     */
    func getMovieDetails(id: Int, completion: @escaping ((MovieDetailsResponse?) -> ())) {
        var detUrl = APIManager.shared.buildUrl(path: Type.details, queryParams: [
            URLQueryItem(name: "append_to_response", value: "videos")
        ])
        detUrl?.path += String(id)
        if let url = detUrl?.url {
            NetworkManager.shared.fetchData(url) { data in
                completion(try? JSONDecoder().decode(MovieDetailsResponse.self, from: data))
            }
        }
    }
}
