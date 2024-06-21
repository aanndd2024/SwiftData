//
//  BookListView.swift
//  SwiftDataDemo
//
//  Created by Anand Yadav on 19-06-2024.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Environment(\.modelContext) private var context
    @Query private var books: [Book]
    @State private var showAddBookButton = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    BookCellView(book: book)
                }
                .onDelete(perform: { indexSet in
                    delete(indexSet: indexSet)
                })
            }.navigationTitle("Reading Logs")
                .navigationDestination(for: Book.self) { book in
                    BookCellView(book: book)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showAddBookButton.toggle()
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                        .sheet(isPresented: $showAddBookButton, content: {
                            AddNewBook()
                        })
                    }
                }
        }
    }
    private func delete(indexSet: IndexSet) {
        indexSet.forEach { index in
            let book = books[index]
            context.delete(book)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    BookListView()
}
