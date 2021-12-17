//
//  DataService.swift
//  Library
//
//  Created by Matt Dahl on 12/16/21.
//


import Foundation

class DataService{
    
    
    static func getLocalData() ->[Book]{
        
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        guard pathString != nil else{
            return [Book]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            let books = try decoder.decode([Book].self, from: data)
            
            
            return books
            
        }
        catch{
            print(error)
        }
        
        return [Book]()
        
    }
}
