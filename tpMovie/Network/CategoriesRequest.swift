//
//  CategoriesRequest.swift
//  tpMovie
//
//  Created by lucas on 18/05/2021.
//

import Foundation

struct CategoriesRequest {
    /**
        Request to the API to get a category list
     */
    func getCategoriesList(completion: @escaping ((CategoryResponse?) -> ())) {
        let catUrl = APIManager.shared.buildUrl(path: Type.categories, queryParams: nil)
        if let url = catUrl?.url {
            NetworkManager.shared.fetchData(url) { data in
                completion(try? JSONDecoder().decode(CategoryResponse.self, from: data))
            }
        }
    }
}
