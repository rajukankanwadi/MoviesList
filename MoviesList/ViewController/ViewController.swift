//
//  ViewController.swift
//  MoviesList
//
//  Created by Raju K on 27/02/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var viewModel = MoviesViewModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The Movie DB"
        tableView.register(UINib.init(nibName: "MovieListTableViewCell", bundle: nil), forCellReuseIdentifier: MovieListTableViewCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        loadMoviesList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    fileprivate func loadMoviesList() {
        activityIndicator.startAnimating()
        DispatchQueue.global().async {
            self.viewModel.fetchMoviesFromServer { moviesInfo, _, error in
                guard error == nil else { return }
                DispatchQueue.main.async {
                    self.tableView.isHidden = false
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
}

// MARK: - UITableView DataSource and Delegate Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movieList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.reuseIdentifier, for: indexPath) as? MovieListTableViewCell {
            let movie = viewModel.movieList[indexPath.row]
            cell.movie = movie
            cell.configureCell(movie: movie)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC: MovieDetailViewController = getVCFromStoryBoardInstance(storyBoard: "Main", StoryBoardID: "MovieDetailViewController") {
            detailVC.viewModel = DetailMovieViewModel()
            detailVC.viewModel?.movie = viewModel.movieList[indexPath.row]
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
