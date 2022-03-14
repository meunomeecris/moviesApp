//
//  ContentView.swift
//  movieApp
//
//  Created by Cris Messias on 25/02/22.
//

import SwiftUI


struct HomeView: View{
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel() //para consumir os dados da ViewModel
    
    var body: some View {
        List(viewModel.movies){ movie in //DataBinding
            Text(movie.title)
        }.onAppear {
            viewModel.getNowPlaying()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
