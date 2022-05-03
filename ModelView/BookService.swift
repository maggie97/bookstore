//
//  BookService.swift
//  Books
//
//  Created by MaggieMendez  on 28/04/22.
//

import Foundation

protocol BooksServiceable {
    func getList() -> [Book]
    func getBookDetail(id: Int) -> Book?
}

struct MockBooksService: HTTPClient, BooksServiceable {
    
    private init(books: [Book] = [
        Book(id: "0", bookId: 0, author: "J. R. R. Tolkien", title: "The Fellowship of the Ring", price: 18.85, genre: [Genre.fantasy, Genre.action], kind: "Novel",description: "The Fellowship of the Ring is the first of three volumes in The Lord of the Rings, an epic set in the fictional world of Middle-earth. The Lord of the Rings is an entity named Sauron, the Dark Lord, who long ago lost the One Ring that contains much of his power. His overriding desire is to reclaim the Ring and use it to enslave all of Middle-earth.", imageName: "https://i.pinimg.com/564x/f4/03/9a/f4039a5f52929f26f5a76cfbefd5f735.jpg", isAvailable: false),
        Book(id: "2", bookId: 1, author: "J. R. R. Tolkien", title: "The Two Towers", price: 11.99, genre: [Genre.fantasy, Genre.action], kind: "Novel", description: "The Fellowship was scattered. Some were bracing hopelessly for war against the ancient evil of Sauron. Some were contending with the treachery of the wizard Saruman. Only Frodo and Sam were left to take the accursed Ring of Power to be destroyed in Mordor–the dark Kingdom where Sauron was supreme. Their guide was Gollum, deceitful and lust-filled, slave to the corruption of the Ring.", imageName: "https://images-na.ssl-images-amazon.com/images/I/51MCZQ7pj1L._SX331_BO1,204,203,200_.jpg", isAvailable: false),
        Book(id: "1", bookId: 2, author: "Yuval Noah Harari", title: "Homo Deus: A Brief History of Tomorrow", price: 19.99, genre: [Genre.history], kind: "Discussion",description: "Yuval Noah Harari envisions a near future in which we face a new set of challenges. Homo Deus explores the projects, dreams and nightmares that will shape the twenty-first century and beyond – from overcoming death to creating artificial life.", imageName: "http://www.findaspark.co.uk/wp-content/uploads/2017/05/sapiens-book-cover.jpg", isAvailable: false),
        Book(id: "1", bookId: 3, author: "Timothy Ferriss", title: "The 4-Hour Workweek", price: 16.15, genre: [Genre.present], kind: "Lifestyle",description: "Forget the old concept of retirement and the rest of the deferred-life plan - there is no need to wait and every reason not to, especially in unpredictable economic times. Whether your dream is escaping the rat race, experiencing high-end world travel, earning a monthly five-figure income with zero management, or just living more and working less, this book is the blueprint.", imageName: "https://media.shortform.com/covers/png/the-4-hour-workweek-cover@8x.png", isAvailable: false),
        Book(id: "1", bookId: 4, author: "Viktor E. Frankl", title: "Man's Search for Meaning", price: 12.25, genre: [Genre.history, Genre.drama], kind: "Psychology",description: "Psychiatrist Viktor Frankl's memoir has riveted generations of readers with its descriptions of life in Nazi death camps and its lessons for spiritual survival. Between 1942 and 1945 Frankl labored in four different camps, including Auschwitz, while his parents, brother, and pregnant wife perished.", imageName: "https://cdn01.sapnaonline.com/product_media/9781846041242/9781846041242.jpg", isAvailable: false),
        Book(id: "1", bookId: 5, author: "Homer", title: "The Odyssey", price: 10.99, genre: [Genre.fantasy, Genre.history], kind: "Novel",description: "After enduring the Trojan War, Odysseus begins the treacherous journey home to Ithaca. On the way, he faces ravenous monsters and vengeful gods. But the real battle awaits, as his kingdom is under siege by unruly suitors vying for his wife’s hand—and his son’s head. To reclaim his throne and save his family, Odysseus must rely on his wits…and help from the unpredictable gods.", imageName: "https://images-na.ssl-images-amazon.com/images/I/51YHjxOpg8L._SX361_BO1,204,203,200_.jpg", isAvailable: false),
        Book(id: "1", bookId: 6, author: "Stuart J. Rossell", title: "Artificial Intelligence: A Modern Approach", price: 22.99, genre: [Genre.scienceFiction, Genre.present], kind: "AI", description: "The long-anticipated revision of this best-selling text offers the most comprehensive, up-to-date introduction to the theory and practice of artificial intelligence.", imageName: "https://images-na.ssl-images-amazon.com/images/I/5113TKVQAEL._SX373_BO1,204,203,200_.jpg", isAvailable: false),
        Book(id: "1", bookId: 7, author: "Ed Catmull", title: "Creativity, Inc.", price: 17.85, genre: [Genre.business, Genre.economics], kind: "Print",description: "This is the story behind the company that changed animation forever. Here, the founder of Pixar reveals the ideas and techniques that have made Pixar one of the most widely admired creative businesses, and one of the most profitable.", imageName: "https://images-na.ssl-images-amazon.com/images/I/31YRLvQciCL._AC_SX60_CR,0,0,60,60_.jpg", isAvailable: false)
    ], cart: Cart = Cart(items: [], numberItems: 0, total: 0.0)) {
        self.books = books
        self.cart = cart
    }
    
    
    static var instance = MockBooksService()
    
    var books: [Book] = [
        Book(id: "0", bookId: 0, author: "J. R. R. Tolkien", title: "The Fellowship of the Ring", price: 18.85, genre: [Genre.fantasy, Genre.action], kind: "Novel",description: "The Fellowship of the Ring is the first of three volumes in The Lord of the Rings, an epic set in the fictional world of Middle-earth. The Lord of the Rings is an entity named Sauron, the Dark Lord, who long ago lost the One Ring that contains much of his power. His overriding desire is to reclaim the Ring and use it to enslave all of Middle-earth.", imageName: "https://i.pinimg.com/564x/f4/03/9a/f4039a5f52929f26f5a76cfbefd5f735.jpg", isAvailable: false),
        Book(id: "2", bookId: 1, author: "J. R. R. Tolkien", title: "The Two Towers", price: 11.99, genre: [Genre.fantasy, Genre.action], kind: "Novel", description: "The Fellowship was scattered. Some were bracing hopelessly for war against the ancient evil of Sauron. Some were contending with the treachery of the wizard Saruman. Only Frodo and Sam were left to take the accursed Ring of Power to be destroyed in Mordor–the dark Kingdom where Sauron was supreme. Their guide was Gollum, deceitful and lust-filled, slave to the corruption of the Ring.", imageName: "https://images-na.ssl-images-amazon.com/images/I/51MCZQ7pj1L._SX331_BO1,204,203,200_.jpg", isAvailable: false),
        Book(id: "1", bookId: 2, author: "Yuval Noah Harari", title: "Homo Deus: A Brief History of Tomorrow", price: 19.99, genre: [Genre.history], kind: "Discussion",description: "Yuval Noah Harari envisions a near future in which we face a new set of challenges. Homo Deus explores the projects, dreams and nightmares that will shape the twenty-first century and beyond – from overcoming death to creating artificial life.", imageName: "http://www.findaspark.co.uk/wp-content/uploads/2017/05/sapiens-book-cover.jpg", isAvailable: false),
        Book(id: "1", bookId: 3, author: "Timothy Ferriss", title: "The 4-Hour Workweek", price: 16.15, genre: [Genre.present], kind: "Lifestyle",description: "Forget the old concept of retirement and the rest of the deferred-life plan - there is no need to wait and every reason not to, especially in unpredictable economic times. Whether your dream is escaping the rat race, experiencing high-end world travel, earning a monthly five-figure income with zero management, or just living more and working less, this book is the blueprint.", imageName: "https://media.shortform.com/covers/png/the-4-hour-workweek-cover@8x.png", isAvailable: false),
        Book(id: "1", bookId: 4, author: "Viktor E. Frankl", title: "Man's Search for Meaning", price: 12.25, genre: [Genre.history, Genre.drama], kind: "Psychology",description: "Psychiatrist Viktor Frankl's memoir has riveted generations of readers with its descriptions of life in Nazi death camps and its lessons for spiritual survival. Between 1942 and 1945 Frankl labored in four different camps, including Auschwitz, while his parents, brother, and pregnant wife perished.", imageName: "https://cdn01.sapnaonline.com/product_media/9781846041242/9781846041242.jpg", isAvailable: false),
        Book(id: "1", bookId: 5, author: "Homer", title: "The Odyssey", price: 10.99, genre: [Genre.fantasy, Genre.history], kind: "Novel",description: "After enduring the Trojan War, Odysseus begins the treacherous journey home to Ithaca. On the way, he faces ravenous monsters and vengeful gods. But the real battle awaits, as his kingdom is under siege by unruly suitors vying for his wife’s hand—and his son’s head. To reclaim his throne and save his family, Odysseus must rely on his wits…and help from the unpredictable gods.", imageName: "https://images-na.ssl-images-amazon.com/images/I/51YHjxOpg8L._SX361_BO1,204,203,200_.jpg", isAvailable: false),
        Book(id: "1", bookId: 6, author: "Stuart J. Rossell", title: "Artificial Intelligence: A Modern Approach", price: 22.99, genre: [Genre.scienceFiction, Genre.present], kind: "AI", description: "The long-anticipated revision of this best-selling text offers the most comprehensive, up-to-date introduction to the theory and practice of artificial intelligence.", imageName: "https://images-na.ssl-images-amazon.com/images/I/5113TKVQAEL._SX373_BO1,204,203,200_.jpg", isAvailable: false),
        Book(id: "1", bookId: 7, author: "Ed Catmull", title: "Creativity, Inc.", price: 17.85, genre: [Genre.business, Genre.economics], kind: "Print",description: "This is the story behind the company that changed animation forever. Here, the founder of Pixar reveals the ideas and techniques that have made Pixar one of the most widely admired creative businesses, and one of the most profitable.", imageName: "https://images-na.ssl-images-amazon.com/images/I/31YRLvQciCL._AC_SX60_CR,0,0,60,60_.jpg", isAvailable: false)
      ]
    
    var cart = Cart(items: [], numberItems: 0, total: 0.0)
    
    func getList() -> [Book] {
        return books
    }
    
    func getBookDetail(id: Int) -> Book? {
        return books.first { $0.bookId == id }
    }
     
    // MARK: CART
    func getCartItems() -> Int {
        return cart.numberItems
    }
    
    func addItem(itemId: Int) {
        guard let book = getBookDetail(id: itemId) else { return }
        
        cart.numberItems += 1
        cart.total += book.price
        cart.items.append(book)
        
    }
    
    
    
    /*
    func getList() async -> Result<[Book], RequestError> {
        return await sendRequest(endpoint: BooksEndpoint.list, responseModel: [Book].self)
    }
    
    func getBookDetail(id: Int) async -> Result<Book, RequestError> {
        return await sendRequest(endpoint: BooksEndpoint.bookDetails(id: id), responseModel: Book.self)
    }*/
    
}
