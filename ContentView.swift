//
//  ContentView.swift
//  Books
//
//  Created by MaggieMendez  on 27/04/22.
//

import SwiftUI
struct FirstView: View {
    
    var bookList: [Book]{
        return MockBooksService.instance.getList()
    }
    @State var animate: Bool = true
    
    var body: some View {
        NavigationView {
            List {
                ForEach(bookList, id: \.self) { book in
                    BookRow(book: book)
                        .padding(.vertical, 8.0)
                }
            }
            .navigationTitle("Books list")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct BookRow: View {
    @State var image: Image?
    let book: Book
    var body: some View {
        NavigationLink(destination: ContentView(book: book)) {
            HStack {
                AsyncImage(url: URL(string: book.imageName), scale: 1) { img in
                    img.resizable()
                } placeholder: {
                    Color.gray
                }
                    .frame(width: 70.0, height: 100.0, alignment: .leading)
                    .cornerRadius(15)
                    .shadow(color: Color.gray, radius: 5.0, x: 2.0, y: 2.0)
                    .padding(.trailing, 5.0)
                VStack(alignment: .leading) {
                    Spacer()
                    Text(book.title)
                        .bold()
                    Text("by \(book.author)")
                        .foregroundColor(Color.gray)
                        .font(Font.subheadline)
                    Spacer()
                    Text("$ \(book.price, specifier: "%.2f")")
                        .foregroundColor(Color.green)
                        .font(Font.title)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView: View {
    
    let book: Book
    
    var body: some View {
        VStack {
            VStack {
                AsyncImage(url: URL(string: book.imageName), scale: 1) { img in
                    img.resizable()
                } placeholder: {
                    Color.gray
                }
                    .frame(width: 190, height: 300, alignment: .center)
                    .cornerRadius(20.0)
                    .shadow(color: Color.gray, radius: 10.0, x: 2.0, y: 2.0)
                    .padding(10.0)

                Text(book.author)
                    .font(Font.body)
                    .foregroundColor(Color.gray)
                Text(book.title)
                    .font(Font.title)
                    .fontWeight(.bold)
                Text(book.description)
                    .padding(14.0)
                    .foregroundColor(Color.gray)
            }
            HStack {
                ForEach(book.genre, id: \.self) { item in
                    OutlineButton(text: item.rawValue ) {}
                }
            }
            Divider()
                .padding(20.0)
            Button("Buy for \(book.price, specifier: "%.2f")") {}
            .padding(15)
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .background(Color.black.cornerRadius(25))
            .foregroundColor(Color.white)
            Spacer()
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CartView()) {
                    ZStack {
                        Image(systemName: "bag")
                            .foregroundColor(Color.black)
                        Text("0")
                            .font(Font
                                    .system(size: 11.0))
                            .padding(.top, 4.0)
                            .foregroundColor(Color.black)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       FirstView()
    }
}
