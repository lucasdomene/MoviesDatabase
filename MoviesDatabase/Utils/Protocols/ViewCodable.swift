//
//  ViewCodable.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/12/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit
import SnapKit

protocol ViewCodable {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalSetup()
    func setupView()
}

extension ViewCodable {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        additionalSetup()
    }
    
    func additionalSetup() {}
}
