//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Anand Yadav on 06-06-2024.
//

import SwiftUI

struct ContentView: View {
    @State private var launchAddNew = false
    var body: some View {
        VStack {
            BookListView()
        }
    }
}

#Preview {
    ContentView()
}
