//
//  DetailViewModel.swift
//  MoviesListTests
//
//  Created by Raju K on 01/03/22.
//

import XCTest
@testable import MoviesList

class DetailViewModelTest: XCTestCase {

    var sut: DetailMovieViewModel!
    var mockedInfo: MoviesListInfo!
    
    override func setUp() {
        super.setUp()
        sut = DetailMovieViewModel()
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
            self.sut.movie = self.mockedInfo.movies?.first
        }
    }
    
    func testMovieDetailObject() throws {
        XCTAssertNotNil(mockedInfo.movies?.first)
        XCTAssertEqual(sut.movie?.title, "Through My Window")
    }

    func testMovieDetailWatchlist() throws {
        let watchlisttuple = sut.setUpWatchListButton()
        XCTAssertEqual(watchlisttuple.1, "Watchlist")
    }
    
    func testMoviePopularity() throws {
        let popularityStr = sut.getPopularityString()
        XCTAssertEqual(popularityStr, "Popularity: 1011.731")
    }
    
    func testMovieVotesCount() throws {
        let votesCountStr = sut.getVotesCountString()
        XCTAssertEqual(votesCountStr, "Votes: 1246")
    }

    
}
