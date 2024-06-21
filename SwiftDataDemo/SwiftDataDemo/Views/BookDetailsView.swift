//
//  BookDetailsView.swift
//  SwiftDataDemo
//
//  Created by Anand Yadav on 20-06-2024.
//

import SwiftUI


struct BookDetailsView: View {
    let book: Book
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var isEditing = false
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var publishedYear: Int? = nil

    init(book: Book) {
        self.book = book
        self._title = State.init(initialValue: book.title)
        self._author = State.init(initialValue: book.author)
        self._publishedYear = State.init(initialValue: book.publishedYear)
    }
    var body: some View {
        Form {
            if isEditing {
                Group {
                    TextField("Book Title", text: $title)
                    TextField("Book Author", text: $author)
                    TextField("Published Year", value: $publishedYear, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                .textFieldStyle(.roundedBorder)
                
                Button("Save") {
                    guard let publishedYear = publishedYear else { return }
                    book.title = title
                    book.author = author
                    book.publishedYear = publishedYear
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }
            } else {
                Text(book.title)
                Text(book.author)
                Text(book.publishedYear.description)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(isEditing ? "Cancel" : "Edit") {
                    isEditing.toggle()
                }
                
            }
        }
        .navigationTitle("Book Details")
    }
}
