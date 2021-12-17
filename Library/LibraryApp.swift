//
//  LibraryApp.swift
//  Library
//
//  Created by Matt Dahl on 12/16/21.
//

import SwiftUI

@main
struct LibraryApp: App {
    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environmentObject(BookModel())
        }
    }
}
