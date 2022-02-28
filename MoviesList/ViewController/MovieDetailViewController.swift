//
//  MovieDetailViewController.swift
//  MoviesList
//
//  Created by Raju K on 28/02/22.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var viewModel: DetailMovieViewModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var votesCountLabel: UILabel!
    @IBOutlet weak var addWatchListButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setuUpUI()
        let action = UIAction { [weak self] _ in
            self?.viewModel?.movie?.watchListed = !(self?.viewModel?.movie?.watchListed ?? false)
            self?.setUpButton()
        }
        addWatchListButton.addAction(action, for: .touchUpInside)
    }
    
    fileprivate func setuUpUI() {
        originalTitleLabel.text = viewModel?.movie?.originalTitle
        titleLabel.text = viewModel?.movie?.title
        overViewLabel.text = viewModel?.movie?.overview
        popularityLabel.text = viewModel?.getPopularityString()
        releaseDateLabel.text = viewModel?.getReleaseDateString()
        votesCountLabel.text = viewModel?.getVotesCountString()
        setUpButton()
    }
    
    func setUpButton() {
        let image =  viewModel?.setUpWatchListButton().0
        let btnTitle = viewModel?.setUpWatchListButton().1
        self.addWatchListButton.setTitle(btnTitle, for: .normal)
        self.addWatchListButton.setImage(image, for: .normal)
    }
}
