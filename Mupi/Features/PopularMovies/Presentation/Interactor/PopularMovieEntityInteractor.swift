//
//  PopularMovieEntityInteractor.swift
//  Mupi
//
//  Created by 🕊️🐢🍵 on 11/11/23.
//

import Foundation
import RxSwift

final class PopularMovieEntityInteractor : InteractorInputProtocol{
    
    var useCase = GetPopularMoviesUseCase()
    var bag = DisposeBag()
    weak var useCaseOutput : InteractorOutputProtocol?
    
    func getMoviesFromUseCase(){
        var useCaseEvent = useCase.getPopularMovieFromRepo()
        useCaseEvent.subscribe { events in
            switch events{
                case .next(let movies):
                    self.useCaseOutput?.requestPopularMoviesSuccessful(popularMovies: movies)
                    break
                case .error(let error):
                    self.useCaseOutput?.requestPopularMoviesDidFail(errorMessage: error.localizedDescription)
                    break
                case .completed:
                    break
            }
        }
        .disposed(by: bag)
        
    }
    
}
