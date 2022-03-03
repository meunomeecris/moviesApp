import Foundation

let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=4612d030c306c0e9b6e7ba7c40a2eb87")

let task = URLSession.shared.dataTask(with: url!) { data, response, error in
    guard let data = data, error == nil else {
        print("Something went wrong!")
        return
    }
}

