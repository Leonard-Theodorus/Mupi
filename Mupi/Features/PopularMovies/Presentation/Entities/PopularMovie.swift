//
//  PopularMovies.swift
//  Mupi
//
//  Created by 🕊️🐢🍵 on 11/11/23.
//

import Foundation

struct PopularMovie{
    var id : UInt32
    var genres : [String]
    var title : String
    var releaseDate : Date
    var posterImageData : Data
    var backdropImageData : Data
    
    init(from movie : Movie) async {
        self.id = movie.id
        self.genres = PopularMovie.movieGenres(from: movie.genreIds)
        self.title = movie.title
        self.releaseDate = movie.releaseDate
        do {
            self.posterImageData = try await NetworkManager.shared.downloadImage(from: movie.posterPath)
            self.backdropImageData = try await NetworkManager.shared.downloadImage(from: movie.backdropPath)
            
        } catch{
            self.posterImageData = Data()
            self.backdropImageData = Data()
        }
        
    }
    
    private static func movieGenres(from ids : [Int]) -> [String]{
        var genres : [String] = []
        for id in ids {
            if let genre = MovieGenres.genre[id]{
                genres.append(genre)
                
            }
        }
        return genres
    }
    
}
