//
//  MoviesViewModel.swift
//  MoviesList
//
//  Created by Raju K on 28/02/22.
//

import Foundation

class MoviesViewModel {
    var movieList:[Movie] = []
    
    func fetchMoviesFromServer(completionHandler: @escaping (MoviesListInfo?, URLResponse?, Error?) -> Void) {
        let url = URL(string: "http://api.themoviedb.org/3/search/movie?api_key=7e588fae3312be4835d4fcf73918a95f&query=a%20&page=01")
        let task = URLSession.shared.movieInfoTask(with: url!) { movieInfo, response, error in
            guard error == nil else {
                completionHandler(nil,response,error)
                return
            }
            if let movieInfo = movieInfo, let movies = movieInfo.movies {
                self.movieList = movies
                completionHandler(movieInfo,response,nil)
            }
        }
        task.resume()

    }
}
