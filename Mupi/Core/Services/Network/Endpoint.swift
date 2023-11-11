//
//  Endpoint.swift
//  Mupi
//
//  Created by 🐈‍⬛🐸 on 06/11/23.
//

import Foundation

enum Endpoint : String{
    
    case trendingMovies = "https://api.themoviedb.org/3/trending/movie"
    
    case popularMovies = "https://api.themoviedb.org/3/movie/popular"
    
    case trendingTvShows = "https://api.themoviedb.org/3/trending/tv"
    
    case popularTvShows = "https://api.themoviedb.org/3/tv/popular"
    
    case searchMovies = "https://api.themoviedb.org/3/search/movie"
    
    case searchTv = "https://api.themoviedb.org/3/search/tv"
    

}
