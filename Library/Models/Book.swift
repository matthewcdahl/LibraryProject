//
//  Book.swift
//  Library
//
//  Created by Matt Dahl on 12/16/21.
//

import Foundation

class Book: Identifiable, Decodable{
    
    var title: String
    var author: String
    var isFavourite: Bool
    var currentPage: Int
    var rating: Int
    var image: String
    var id: Int
    var content: [String]
    
}

