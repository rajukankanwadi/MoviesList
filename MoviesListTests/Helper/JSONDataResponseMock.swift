//
//  JSONDataResponseMock.swift
//  MoviesListTests
//
//  Created by Raju K on 28/02/22.
//

import Foundation
@testable import MoviesList

class JSONDataResponseMock {
    static func fetchData(completionHandler: @escaping (_ movieListInfo: MoviesListInfo) -> ()) {
        if let path = Bundle.main.path(forResource: "MoviesInfoResponse", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) {
                let decoder = JSONDecoder()
                if let movieListInfo = try? decoder.decode(MoviesListInfo.self, from: data) {
                    completionHandler(movieListInfo)
                }
            }
        }
    }
}
