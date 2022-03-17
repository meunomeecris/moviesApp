//
//  ContentView.swift
//  movieApp
//  Created by Cris Messias on 25/02/22.
//
//

import SwiftUI
import Alamofire


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
                        NavigationLink(destination: DetailsView(viewModel: DetailsViewModel(detailsMovie: movie))) { //especificando o que é concreto
                            VStack(){
                                AsyncImage(url: URL(string: movie.completePosterPath)) { movie in
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
                                Text(movie.title)
                                    .font(.title3)
                                    .bold()
                                    .lineLimit(1)
                                    .listRowSeparator(.hidden)
                                    .foregroundColor(.black)
                            } //end the VStack
                        } //end the NavigationLink
                        .onTapGesture {
                            print(movie.title)
                        }
                    } //end the ForEach
                    .padding(12)
                } //end LazyVGrid
                .padding(16)
            } //end the ScrollView
            .navigationTitle("Now Playing")
        } //end the NavigationView
        .onAppear {
            viewModel.getNowPlaying()
        }
    }//end the body view
}//end the view



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
