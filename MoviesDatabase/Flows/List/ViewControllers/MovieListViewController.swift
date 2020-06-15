//
//  MovieListViewController.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/12/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var movies = [Movie]()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constraints.cellSpacing
        layout.minimumInteritemSpacing = Constraints.cellSpacing
        layout.sectionInset.left = Constraints.cellSpacing
        layout.sectionInset.right = Constraints.cellSpacing
        let collectionView = UICollectionView(frame: .zero,
                                collectionViewLayout: layout)
        collectionView.backgroundColor = R.color.dimGray()
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        let bodyEncoder = BodyEncoder()
        let urlEncoder = URLEncoder()
        let parameterEncoder = ParameterEncoder(bodyEncoder: bodyEncoder,
                                                urlEncoder: urlEncoder)
        let session = URLSession.shared
        let networkManager = NetworkManager(
            session: session, parameterEncoder: parameterEncoder
        )
        
        let movieService = MovieService(networkManager: networkManager)
        movieService.fetch(page: 1) { [weak self] result in
            switch result {
            case .success(let movies):
                print(movies)
                self?.movies = movies
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func registerCells() {
        collectionView.register(MoviewCell.self,
                                forCellWithReuseIdentifier: Identifiers.movieCell)
    }
    
}

extension MovieListViewController: ViewCodable {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MovieListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Identifiers.movieCell,
            for: indexPath) as! MoviewCell
        
        let movie = movies[indexPath.row]
        
        cell.imageView.image = R.image.moviePoster()
        cell.headlineView.titleLabel.text = movie.title
        cell.headlineView.yearLabel.text = movie.year
        
        return cell
    }
    
}

extension MovieListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - Constraints.cellSpacing * 3.0) / 2
        let height = width * 2
        return CGSize(width: width, height: height)
    }
    
}
