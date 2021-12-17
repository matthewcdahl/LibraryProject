//
//  BookModel.swift
//  Library
//
//  Created by Matt Dahl on 12/16/21.
//

import Foundation

class BookModel: ObservableObject{
    
    @Published var books: [Book] = [Book]()
    
    init(){
        //Call dataservicer
        self.books = DataService.getLocalData()
    }
    
    func updateFavorite(forId: Int){
        //self.books[index-1].isFavourite.toggle()
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }
    }
    
    /// Update the specified book's rating. Does nothing if `forId` is invalid.
    func updateRating(forId: Int, rating: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
        }
    }
    
    func updatePage(forId: Int, page: Int){
        if let index = books.firstIndex(where: { $0.id == forId}){
            books[index].currentPage = page
        }
    }
    
    
    
}
