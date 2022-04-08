//
//  ContentView.swift
//  movieApp
//  Created by Cris Messias on 25/02/22.
//
//

import SwiftUI
import Alamofire
import CoreMedia


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
                    ForEach(viewModel.searchResults(), id: \.self) { movie in //DataBinding
                        NavigationLink(destination: DetailsView(viewModel: DetailsViewModel(detailsMovie: movie))) { //especificando o que é concreto
                            VStack(){
                                PosterMovie(argumentoURL: "\(movie.completePosterPath)")
                                TitleHome(title: "\(movie.title)")
                            }//end the VStack
                        }//end the NavigationLink
                        .onTapGesture {
                            print(movie.title)
                        }
                    } //end the ForEach
                    .padding(16)
                } //end LazyVGrid
                .padding(16)
            } //end the ScrollView
            .navigationTitle("Now Playing") //navigationViewTitleColor
        } //end the NavigationView
        .searchable(text: $viewModel.searchText, prompt: "Search By Movie Name") //binding bidirecional
        .onAppear {
            viewModel.getNowPlaying()
        }
    }//end the body view
}//end the view


struct TitleHome: View{
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    var title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .bold()
            .lineLimit(1)
            .listRowSeparator(.hidden)
            .foregroundColor(Color("DarkMode"))
    }
}


struct PosterMovie: View{
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    var argumentoURL: String
    var body: some View{
        
        AsyncImage(url: URL(string: argumentoURL)) { movie in
            if let image = movie.image {
                image.resizable() // Displays the loaded image.
            } else if movie.error != nil {
                Color.red // Indicates an error.
            } else {
                Color.blue // Acts as a placeholder.
            }
        } //end the AsyncImage
        .frame(width: 170, height: 250)
        .cornerRadius(15)
        .listRowSeparator(.hidden)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
