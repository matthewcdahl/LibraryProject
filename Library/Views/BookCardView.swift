//
//  BookCardView.swift
//  Library
//
//  Created by Matt Dahl on 12/16/21.
//

import SwiftUI

struct BookCardView: View {
    
    var book: Book
    @State var fav = false
    
    var body: some View {
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    //.frame(width: geo.size.width-40, height: geo.size.height-140, alignment: .center)
                    .cornerRadius(7)
                    .shadow(color: .black, radius: 10, x: 4, y: 4)
                VStack(alignment: .leading, spacing: 0){
                    //TODO: Hstack for Star
                    HStack{
                        Text(book.title)
                            .bold()
                            .font(.title)
                        Spacer()
                        if(fav){
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.trailing)
                        }
                    }
                    Text(book.author)
                        .italic()
                        .padding(.vertical)
                        
                    Image(book.image)
                        .resizable()
                        .scaledToFit()
                        
                }
                .padding()
                
                
            }
            .padding()
            .onAppear(perform: {
                fav = book.isFavourite
            })
        
        
        
    }
    
}

struct BookCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookCardView(book: model.books[0])
    }
}
