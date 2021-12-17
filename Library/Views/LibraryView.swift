//
//  ContentView.swift
//  Library
//
//  Created by Matt Dahl on 12/16/21.
//

import SwiftUI

struct LibraryView: View {
    
    @EnvironmentObject var model: BookModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    ForEach(model.books){b in
                        NavigationLink(destination: BookDetailView(book: b)) {
                            BookCardView(book: b)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .navigationTitle("My Library")
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(BookModel())
    }
}
