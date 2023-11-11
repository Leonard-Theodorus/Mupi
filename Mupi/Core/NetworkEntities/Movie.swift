//
//  Movie.swift
//  Mupi
//
//  Created by 🐈‍⬛🐸 on 06/11/23.
//

import Foundation

struct MovieRepo : Codable{
    var results : [Movie]
}

struct Movie : Codable{
    var backdropPath : URL
    var genreIds : [Int]
    var id : UInt32
    var title : String
    var releaseDate : Date
    var posterPath : URL
    
    enum CodingKeys : String, CodingKey{
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
    
}

//struct MovieGenre : Codable{
//    var id : Int
//}
