//
//  ContentView.swift
//  movieApp
//
//  Created by Cris Messias on 25/02/22.
//

import SwiftUI
import Alamofire

struct HomeView: View{
    var movieService = MovieService()
    @State var listOfMovies = [Movie]()
    
    var body: some View {
        Text("Don't stress, do your best")
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
