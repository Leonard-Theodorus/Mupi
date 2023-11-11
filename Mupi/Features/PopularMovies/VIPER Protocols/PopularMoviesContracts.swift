//
//  PopularMoviesContracts.swift
//  Mupi
//
//  Created by 🕊️🐢🍵 on 11/11/23.
//

import Foundation

protocol InteractorInputProtocol : AnyObject{
    func getMoviesFromUseCase()
}

protocol InteractorOutputProtocol : AnyObject{
    func requestPopularMoviesSuccessful(popularMovies : [PopularMovie])
    
    func requestPopularMoviesDidFail(errorMessage : String)
}

protocol PresenterProtocol : AnyObject{
    var interactor : InteractorInputProtocol? { get set }
    var router : RouterProtocol? {get set}
    var view : ViewProtocol? {get set}
    func fetchPopularMovies()
    func presentMovieDetails()
    func viewDidFinishLoading()
}

protocol RouterProtocol : AnyObject{
    //TODO: Masukin Present Detail For Object
    func presentDetail()
}

protocol ViewProtocol : AnyObject{
    func loadingView()
    func didFinishLoading(popularMovies : [PopularMovie])
    func presentError(message : String)
}

