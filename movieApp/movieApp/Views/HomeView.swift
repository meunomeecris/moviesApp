//
//  ContentView.swift
//  movieApp
//  Created by Cris Messias on 25/02/22.
//
//

import SwiftUI


struct HomeView: View{
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel() //para consumir os dados da ViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.movies) { movie in //DataBinding
                        VStack(alignment: .leading){
                            AsyncImage(url: URL(string: movie.completePosterPath)) { movie in
                                if let image = movie.image {
                                    image.resizable() // Displays the loaded image.
                                } else if movie.error != nil {
                                    Color.red // Indicates an error.
                                } else {
                                    Color.blue // Acts as a placeholder.
                                }
                            }
                            .frame(width: 150, height: 250)
                            .cornerRadius(20)
                            .listRowSeparator(.hidden)
                            Text(movie.title)
                                .font(.title3)
                                .bold()
                                .listRowSeparator(.hidden)
                                .lineLimit(1)
                        }
                    }
                    .padding(20)
                }
                .padding(20)
            }
            .navigationTitle("Now Playing")
        }
        .onAppear {
            viewModel.getNowPlaying()
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
