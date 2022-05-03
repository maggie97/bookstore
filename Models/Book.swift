//
//  Book.swift
//  Books
//
//  Created by MaggieMendez  on 28/04/22.
//

import Foundation

struct Book: Decodable, Identifiable, Hashable {
    let id: String
    let bookId: Int
    let author: String
    let title: String
    let price: Float
    let genre: [Genre]
    let kind: String
    let description: String
    let imageName: String
    let isAvailable: Bool
    
}
