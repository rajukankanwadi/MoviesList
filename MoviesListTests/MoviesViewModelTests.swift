//
//  MoviesViewModelTests.swift
//  MoviesListTests
//
//  Created by Raju K on 28/02/22.
//

import XCTest
@testable import MoviesList

class MoviesViewModelTests: XCTestCase {

    var sut: MoviesViewModel!
    var mockedInfo: MoviesListInfo!
    
    override func setUp() {
        super.setUp()
        sut = MoviesViewModel()
        fetchData()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        mockedInfo = nil
    }

    func fetchData() {
        JSONDataResponseMock.fetchData { movieListInfo in
            self.mockedInfo = movieListInfo
        }
    }
    
    func testDownloadListFunction() {
        let asyncDone = expectation(description: "Load Movie list from server")

        sut.fetchMoviesFromServer { moviesListInfo, _, error in
            self.sut.movieList = moviesListInfo!.movies!
            asyncDone.fulfill()
        }
        wait(for: [asyncDone], timeout: 10)
        XCTAssertEqual(self.mockedInfo.movies?.count, sut.movieList.count)

        for i in 0..<mockedInfo.movies!.count {
            let mockedovie = mockedInfo.movies?[i]
            let serverMovie = sut.movieList[i]
            XCTAssertEqual(mockedovie!, serverMovie)
        }
        XCTAssertEqual(self.mockedInfo.movies?.first?.id, sut.movieList.first?.id)
        XCTAssertGreaterThan(sut.movieList.count, 0)
    }
    
}
