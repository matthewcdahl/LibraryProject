//
//  BookWordsView.swift
//  Library
//
//  Created by Matt Dahl on 12/16/21.
//

import SwiftUI

struct BookWordsView: View {
    
    @EnvironmentObject var model: BookModel
    @State private var selectedPage: Int = 0
    @State var page = 0
    
    var book: Book
    
    var body: some View {
        TabView(selection: $page){
            ForEach(0..<book.content.count){ i in
                ScrollView{
                    VStack(alignment: .leading){
                        Text(book.content[i])
                            .padding()
                    }
                    Text(String(i+1))
                        .bold()
                        .font(.title2)
                }.tag(i+1)
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            page = book.currentPage
                        }
                    })
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onDisappear(perform: {
            model.updatePage(forId: book.id, page: page)
        })
        
        
    }
    
    
    
}

struct BookWordsView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookWordsView(book: model.books[0])
    }
}
