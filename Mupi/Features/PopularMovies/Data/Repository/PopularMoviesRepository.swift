//
//  RemoteRepository.swift
//  Mupi
//
//  Created by 🐈‍⬛🐸 on 07/11/23.
//

import Foundation
import RxSwift

final class PopularMoviesRepository{
    func preparePopularMoviesForDomain() -> Observable<[PopularMovie]> {
        var moviesObserver = Observable<[PopularMovie]>.from([])
        Task{
            let movies = try await dataSource.getPopularMovies()
            moviesObserver = Observable.just(movies)
            return moviesObserver
        }
        return moviesObserver
    }
    
    
}
