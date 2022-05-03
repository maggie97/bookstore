//
//  ShopCar.swift
//  Books
//
//  Created by MaggieMendez  on 28/04/22.
//

import Foundation

class Cart{
    
    var items: [Book]
    var numberItems: Int
    var total: Float
    
    init(items: [Book], numberItems: Int, total: Float) {
        self.items = items
        self.numberItems = numberItems
        self.total = total
    }
}

