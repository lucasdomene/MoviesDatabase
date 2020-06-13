//
//  MovieFooterView.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/12/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

class MovieFooterView: UIView {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        title.font = R.font.sfProRoundedSemibold(size: 14)
        title.textColor = R.color.mintCream()
        return title
    }()
    
    lazy var yearLabel: UILabel = {
        let year = UILabel()
        year.font = R.font.sfProRoundedLight(size: 10)
        year.textColor = R.color.mintCream()
        return year
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieFooterView: ViewCodable {
   
    func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(yearLabel)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
}
