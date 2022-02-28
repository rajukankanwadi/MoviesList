//
//  DetailMovieViewModel.swift
//  MoviesList
//
//  Created by Raju K on 28/02/22.
//

import Foundation
import UIKit

class DetailMovieViewModel {
    var movie: Movie?
    
    func setUpWatchListButton() ->(UIImage,String) {
        if let movie = movie {
            let image =  movie.watchListed ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            let btnTitle = movie.watchListed ? "Watchlisted" : "Watchlist"
            return (image!,btnTitle)
        }
        return (UIImage(systemName: "star")!,"Watchlist")
    }
    
    func getPopularityString() -> String {
        let str = movie?.popularity ?? 0.0
        return "Popularity: \(String(str))"
    }
    
    func getReleaseDateString() -> String {
        let str = movie?.releaseDate ?? "NA"
        return "Release Date: \(String(str))"
    }
    
    func getVotesCountString() -> String {
        let str = movie?.voteCount ?? 0
        return "Votes: \(String(str))"
    }
}
