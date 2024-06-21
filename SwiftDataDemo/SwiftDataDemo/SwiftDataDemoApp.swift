//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by Anand Yadav on 06-06-2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Book.self])
        }
    }
}
