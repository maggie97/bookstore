//
//  BooksEndpoint.swift
//  Books
//
//  Created by MaggieMendez  on 28/04/22.
//

import Foundation

enum BooksEndpoint {
    case list
    case bookDetails(id: Int)
}

extension BooksEndpoint: Endpoint {
    
    var path: String {
            switch self {
            case .list:
                return "books"
            case .bookDetails(let id):
                return "books/\(id)"
            }
    }

    var method: RequestMethod {
        switch self {
        case .list, .bookDetails:
            return .get
        }
    }

    var header: [String: String]? {
        // Access Token to use in Bearer header
        // let accessToken = "Your TMDB Access Token here!!!!!!!"
        switch self {
        case .list, .bookDetails:
            return [
                "Accept": "application/json"
            ]
        }
    }
        
    var body: [String: String]? {
        switch self {
        case .list, .bookDetails:
            return nil
        }
    }
}
