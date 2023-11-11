//
//  PopularMoviePresenter.swift
//  Mupi
//
//  Created by 🕊️🐢🍵 on 11/11/23.
//

import Foundation

class PopularMoviePresenter : PresenterProtocol{
    weak var interactor: InteractorInputProtocol?
    
    weak var router: RouterProtocol?
    
    weak var view: ViewProtocol?
    
    func fetchPopularMovies() {
        guard let interactor else {return}
        interactor.getMoviesFromUseCase()
    }
    
    func presentMovieDetails() {
        guard let router else {return}
        router.presentDetail()
    }
    
    func viewDidFinishLoading() {
        guard let view else {return}
        view.loadingView()
        fetchPopularMovies()
    }

}

extension PopularMoviePresenter : InteractorOutputProtocol{
    func requestPopularMoviesSuccessful(popularMovies: [PopularMovie]) {
        view?.didFinishLoading(popularMovies: popularMovies)
    }
    
    func requestPopularMoviesDidFail(errorMessage: String) {
        view?.presentError(message: errorMessage)
    }
}
