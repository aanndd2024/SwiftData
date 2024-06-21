//
//  AddNewBook.swift
//  SwiftDataDemo
//
//  Created by Anand Yadav on 07-06-2024.
//

import SwiftUI
import SwiftData

struct AddNewBook: View {
    @State private var title:String = ""
    @State private var author:String = ""
    @State private var publishedYear:Int?
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    private var isValid:Bool {
        !title.isEmpty && !author.isEmpty && publishedYear != nil
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Book Title:")
                TextField("Enter Title:", text: $title).textFieldStyle(.roundedBorder)
                
                Text("Author:")
                TextField("Enter book author:", text: $author).textFieldStyle(.roundedBorder)
                
                Text("Published Year:")
                TextField("Enter published year", value: $publishedYear, format: .number).textFieldStyle(.roundedBorder)
            }
            HStack {
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
                .buttonStyle(.bordered)
                Spacer()
                
                Button("Save"){
                    guard let publishedYear else { return }
                    let book = Book(title: title, author: author, publishedYear: publishedYear)
                    context.insert(book)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }
                .buttonStyle(.bordered)
                .disabled(!isValid)
            }
            Spacer()
                .navigationTitle("Add New Book")
        }
        .padding()
    }
}

#Preview {
    AddNewBook()
}
