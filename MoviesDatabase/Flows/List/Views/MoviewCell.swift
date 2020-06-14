//
//  MoviewCell.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/12/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

final class MoviewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
        return stackView
    }()
    
    let headlineView = MovieHeadlineView(frame: .zero)
    
    lazy var favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        
        favoriteButton.setImage(R.image.favoriteNormal(),
                                for: .normal)
        favoriteButton.setImage(R.image.favoriteSelected(),
                                for: .highlighted)
        
        return favoriteButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MoviewCell: ViewCodable {
    
    func buildViewHierarchy() {
        addSubview(imageView)
        addSubview(stackView)
        addSubview(favoriteButton)
        stackView.addArrangedSubview(headlineView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(imageView.snp.width).multipliedBy(1.5)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.width.height.equalTo(Constraints.buttonSize)
            make.top.equalTo(imageView.snp.bottom)
                .offset(Constraints.margin * 2)
            make.right.equalToSuperview()
                .inset(Constraints.margin)
        }

        stackView.snp.makeConstraints { make in
            make.left.equalToSuperview()
                .inset(Constraints.margin)
            make.right.equalTo(favoriteButton.snp.left)
                .offset(Constraints.margin)
            make.top.equalTo(imageView.snp.bottom)
                .offset(Constraints.margin * 2)
            make.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    func additionalSetup() {
        backgroundColor = R.color.rustySilver()
    }
 
}
