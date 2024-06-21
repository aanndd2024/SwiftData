//
//  BookCellView.swift
//  SwiftDataDemo
//
//  Created by Anand Yadav on 19-06-2024.
//

import SwiftUI

struct BookCellView: View {
    let book: Book
    var body: some View {
        NavigationLink(value: book) {
            VStack (alignment: .leading) {
                Text(book.title).bold()
                HStack{
                    Text("Author: \(book.author)")
                    Spacer()
                    Text("Published Year: \(book.publishedYear.description)")
                }.font(.subheadline)
            }
            .navigationDestination(for: Book.self) { book in
                BookDetailsView(book: book)
            }
        }
    }
}

//#Preview {
//    BookCellView()
//}
