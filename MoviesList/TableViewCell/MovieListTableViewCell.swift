//
//  MovieListTableViewCell.swift
//  MoviesList
//
//  Created by Raju K on 27/02/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    static let reuseIdentifier = "MovieListTableViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var watchListButton: UIButton!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var movie: Movie?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        watchListButton.setImage(UIImage(systemName: "star"), for: .normal)
        contentView.layer.cornerRadius = 6
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
        
    func configureCell(movie: Movie) {
        let image =  movie.watchListed ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        watchListButton.setImage(image, for: .normal)
        titleLabel.text = movie.title
        overViewLabel.text = movie.overview
        popularityLabel.text = "Popularity: \(String(describing: movie.popularity!))"
        releaseDateLabel.text = "Release Date: \(String(describing: movie.releaseDate!))"
    }
    
    @IBAction func watchListButtonPressed(_ sender: Any) {
        if let currMovie = movie {
            currMovie.watchListed = !currMovie.watchListed
            let image =  currMovie.watchListed ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            watchListButton.setImage(image, for: .normal)
        }
    }
    
}
