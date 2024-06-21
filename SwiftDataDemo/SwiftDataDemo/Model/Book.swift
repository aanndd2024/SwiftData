//
//  Book.swift
//  SwiftDataDemo
//
//  Created by Anand Yadav on 06-06-2024.
//

import Foundation
import SwiftData

@Model
final class Book {
    var title:String
    var author:String
    var publishedYear:Int
    
    init(title: String, author: String, publishedYear: Int) {
        self.title = title
        self.author = author
        self.publishedYear = publishedYear
    }
}

// Always create class type model for SwiftData


