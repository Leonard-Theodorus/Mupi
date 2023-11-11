//
//  GetPopularMoviesUseCase.swift
//  Mupi
//
//  Created by 🐈‍⬛🐸 on 07/11/23.
//

import Foundation
import RxSwift

final class GetPopularMoviesUseCase{
    let repository = PopularMoviesRepository()
    
    func getPopularMovieFromRepo() -> Observable<[PopularMovie]>{
        let repoEvent = repository.preparePopularMoviesForDomain()
        return repoEvent
    }
    
}
