//
//  OutlineButton.swift
//  Books
//
//  Created by MaggieMendez  on 28/04/22.
//

import SwiftUI

struct OutlineButton: View {
    let text: String
    let action: () -> Void
    var body: some View {
        Button(text) { action() }
        .padding(10.0)
        .foregroundColor(Color.black)
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1))
    }
}

struct OutlineButton_Previews: PreviewProvider {
    static var previews: some View {
        OutlineButton(text: "Fantasy") {
            print("Holi")
        }
    }
}
