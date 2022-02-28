//
//  Extensions.swift
//  MoviesList
//
//  Created by Raju K on 28/02/22.
//

import Foundation
import UIKit

// MARK: - URLSession response handlers
extension URLSession {
    fileprivate func getTaskFromURL<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }

            if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                let jsonData = JSONString.data(using: .utf8)!
                let decoder = JSONDecoder()
                let dataReceived = try? decoder.decode(T.self, from: jsonData)
                completionHandler(dataReceived, response, nil)

            }
        }
    }

    func movieInfoTask(with url: URL, completionHandler: @escaping (MoviesListInfo?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.getTaskFromURL(with: url, completionHandler: completionHandler)
    }
}


// MARK: - Get ViewController Instance Method
    func getVCFromStoryBoardInstance<T:UIViewController>(storyBoard: String, StoryBoardID: String) ->T? {
        let storyBoard = UIStoryboard.init(name: storyBoard, bundle: nil)
        if let vc = storyBoard.instantiateViewController(identifier: StoryBoardID) as? T {
            return vc
        }
        return T()
    }
