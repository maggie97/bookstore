//
//  Cart.swift
//  Books
//
//  Created by MaggieMendez  on 02/05/22.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                if let book = MockBooksService.instance.getBookDetail(id: 1) {
                    CartItem(book: book  )
                }
            }
        }
    }
}

struct CartItem: View {
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
                Button {
                    print("add")
                } label: {
                    Text("+")
                        .padding(.bottom, 2)
                        .frame(width: 22, height: 22)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                }
                
                Text("1")
                
                Button {
                    print("add")
                } label: {
                    Text("-")
                        .padding(.bottom, 2)
                        .frame(width: 22, height: 22)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                }

            }
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
