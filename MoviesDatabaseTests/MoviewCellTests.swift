//
//  MoviewCellTests.swift
//  MoviesDatabaseTests
//
//  Created by lucas.firmo on 6/12/20.
//  Copyright © 2020 domene. All rights reserved.
//

import XCTest
import SnapshotTesting

@testable import MoviesDatabase

class MoviewCellTests: XCTestCase {

    func testMovieCell() {
        let size = CGSize(width: 200, height: 400)
        let movieCell = MoviewCell(frame: CGRect(origin: .zero,
                                                 size: size))
        
        movieCell.imageView.image = R.image.moviePoster()
        movieCell.headlineView.titleLabel.text = "Ad Astra"
        movieCell.headlineView.yearLabel.text = "2019"
        
        assertSnapshot(matching: movieCell,
                       as: .image,
                       record: false)
    }
    
}
