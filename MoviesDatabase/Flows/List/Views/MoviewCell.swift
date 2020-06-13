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
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
        return stackView
    }()
    
    let footerView = MovieFooterView(frame: .zero)
    
    lazy var favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        
        let favoriteImageNormal = UIImage(systemName: "heart")
        let favoriteImageSelected = UIImage(systemName: "heart.fill")
        
        favoriteButton.setImage(favoriteImageNormal, for: .normal)
        favoriteButton.setImage(favoriteImageSelected, for: .selected)
        
        favoriteButton.tintColor = R.color.limeGreen()
        
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
        stackView.addArrangedSubview(footerView)
        stackView.addArrangedSubview(favoriteButton)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.width.height.equalTo(30).priority(.required)
        }
        
        stackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(8)
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    func additionalSetup() {
        backgroundColor = R.color.rustySilver()
    }
 
}
