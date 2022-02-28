//
//  MoviesListTests.swift
//  MoviesListTests
//
//  Created by Raju K on 27/02/22.
//

import XCTest
@testable import MoviesList

class MoviesListTests: XCTestCase {

    var sut: MoviesListInfo!
    
    override func setUp() {
        super.setUp()
        fetchData()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func fetchData() {
        JSONDataResponseMock.fetchData { movieListInfo in
            self.sut = movieListInfo
        }
    }

    func testNumberOfMoviesbjects() throws {
        let count = sut.movies?.count ?? 0
        XCTAssertGreaterThan(count, 0)
    }

    func testMovieList() throws {
        for movie in sut.movies! {
            XCTAssertNotNil(movie)
        }
    }
    
    func testEachMovieObject() throws {
        if let movies = sut.movies {
            for movie in movies {
                XCTAssertNotNil(movie.id)
                XCTAssertNotNil(movie.title)
                XCTAssertNotNil(movie.originalTitle)
                XCTAssertNotNil(movie.popularity)
                XCTAssertNotNil(movie.voteCount)
                XCTAssertNotNil(movie.releaseDate)
                XCTAssertNotNil(movie.overview)
            }
        }
    }

    func testMovieObjectWithID() throws {
        if let movies = sut.movies {
            let movie = movies.filter{$0.id == 714968}.first
            
            XCTAssertEqual(movie?.title, "Plan A")
            XCTAssertEqual(movie?.adult, false)
            XCTAssertEqual(movie?.backdropPath, "/c2cb0lLvbzvHlSUo35W8CfP0kYO.jpg")
            XCTAssertEqual(movie?.originalTitle, "Plan A")
            XCTAssertEqual(movie?.originalLanguage, "en")
            XCTAssertEqual(movie?.popularity, 150.746)
            XCTAssertEqual(movie?.releaseDate, "2021-08-16")
            XCTAssertEqual(movie?.voteAverage, 6.1)
            XCTAssertEqual(movie?.voteCount, 38)
            XCTAssertEqual(movie?.posterPath, "/dfYOmisdbiVTXdcQji35pKywPFI.jpg")
            XCTAssertEqual(movie?.video, false)
            XCTAssertEqual(movie?.genreIds, [53])
            XCTAssertEqual(movie?.overview, "Germany 1945, Max, a Jewish Holocaust survivor, meets a radical group of Jewish resistance fighters, who, like him, lost all hope for their future after they were robbed of their existence and their entire families were killed by the Nazis. They dream of retaliation on an epic scale for the Jewish people. An eye for an eye, a tooth for a tooth. Max starts identifying with the group's monstrous plans...")
            
        }
    }
    
    func testFetchDataPerformance() throws {
        measure {
            fetchData()
        }
    }
}
