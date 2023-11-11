//
//  PopularMovieCard.swift
//  Mupi
//
//  Created by 🕊️🐢🍵 on 11/11/23.
//

import UIKit

class PopularMovieCard: UIView {
    private let movieImage : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(frame: CGRect, movie: PopularMovie) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        movieImage.image = UIImage(data: movie.posterImageData)
        setupImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageConstraints(){
        NSLayoutConstraint.activate([
            movieImage.widthAnchor.constraint(equalToConstant: 100),
            movieImage.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
}
