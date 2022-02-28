//
//  MoviesListInfo.swift
//  MoviesList
//
//  Created by Raju K on 28/02/22.
//

import Foundation

class MoviesListInfo: Codable {

  var page: Int?
  var movies: [Movie]? = []
  var totalPages: Int?
  var totalResults: Int?

  enum CodingKeys: String, CodingKey {
    case page         = "page"
    case movies       = "results"
    case totalPages   = "total_pages"
    case totalResults = "total_results"
  }
}
