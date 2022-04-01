//
//  FavoritesView.swift
//  movieApp
//
//  Created by Cris Messias on 31/03/22.
//

import SwiftUI

struct FavoritesView: View {
    var userDefaultsFavoriteService: FavoriteType = UserDefaultsFavoriteService()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {

        Text("test")
//        NavigationView{
//            LazyVGrid(columns: columns){
//                ForEach(userDefaultsFavoriteService.getFavorites) { favorite in
//                    VStack{
//                    AsyncImage(url: URL(string: favorite.completePosterPath)) { movie in
//                        if let image = movie.image {
//                            image.resizable() // Displays the loaded image.
//                        } else if movie.error != nil {
//                            Color.red // Indicates an error.
//                        } else {
//                            Color.blue // Acts as a placeholder.
//                        }
//                    }
//                    .frame(width: 170, height: 250)
//                    .cornerRadius(15)
//                    .listRowSeparator(.hidden)
//                    Text("\(favorite.title)")
//                }
//                }
//            }
//            .navigationTitle("My Favorites")
//        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
