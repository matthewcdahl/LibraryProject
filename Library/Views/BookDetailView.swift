//
//  BookDetailView.swift
//  Library
//
//  Created by Matt Dahl on 12/16/21.
//

import SwiftUI

struct BookDetailView: View {
    
    @EnvironmentObject var model: BookModel
    @State var bookRating: Int = 3
    @State var fav: Bool = true
    @State var favUpdated = true
    var book: Book
    
    

    
    var body: some View {
            VStack{
                //MARK: Read now
                Text("Read Now!")
                    .font(.title)
                    .padding(.top)
                NavigationLink(destination:{
                    BookWordsView(book: book)
                }){
                    Image(book.image)
                        .resizable()
                        .scaledToFit()
                }
                
                //MARK: Featured
                Text("Mark for Later!")
                    .font(.title3)
                    .bold()
                    .padding(.top, 10)
                    .padding(.bottom, 6)
                Button(action:{
                    fav.toggle()
                    favUpdated.toggle()
                }){
                    if(!fav){
                        Image(systemName: "star")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 30, height: 30, alignment: .center)
                            .padding(.bottom, 8)
                    } else{
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 30, height: 30, alignment: .center)
                            .padding(.bottom, 8)
                    }
                }
                .onChange(of: favUpdated, perform: {value in
                    model.updateFavorite(forId: book.id)
                    print("UPDATED FAVORITE: " + String(book.isFavourite))
                })
                
                //MARK: Rating
                Text("Rate Amazing Words")
                    .bold()
                    .padding(.top)
                    .padding(.bottom, 6)
                Picker("Rating", selection: $bookRating){
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 40)
                .padding(.horizontal, 20)
                .onChange(of: bookRating, perform: { value in
                    model.updateRating(forId: book.id, rating: bookRating)
                })
                
                
                Spacer()
            }
            .navigationBarTitle(book.title)
            .onAppear {
                bookRating = book.rating
                fav = book.isFavourite
            }

                                
    }
    
   
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: BookModel().books[0])
            .environmentObject(BookModel())
    }
}
