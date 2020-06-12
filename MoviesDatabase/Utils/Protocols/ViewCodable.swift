//
//  ViewCodable.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/12/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

protocol ViewCodable where Self: UIView {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalSetup()
    func setupView()
}

extension ViewCodable where Self: UIView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        additionalSetup()
    }
}
