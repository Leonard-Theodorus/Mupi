//
//  RemoteDataSource.swift
//  Mupi
//
//  Created by 🐈‍⬛🐸 on 06/11/23.
//

import Foundation
import RxSwift

final class PopularDataSource : RemoteDataSourceProtocol{
    let networkService = NetworkManager.shared
    
    func getPopularMovies() async throws -> Observable<[PopularMovie]>{
        var popularMovies : [PopularMovie] = []
        let endpoint = Endpoint.popularMovies.rawValue
        
        let networkRequest = Request(endpoint: Endpoint.popularMovies, method: .get).makeRequest()
        
        var movies : [Movie] = []
        
        guard let networkRequest else {return Observable.empty()}
        do{
            guard var moviesRepo = try await  self.networkService.makeNetworkCall(request: networkRequest, type: MovieRepo.self) else {return Observable.empty()}
            
            movies = moviesRepo.results
            for movie in movies {
                await popularMovies.append(.init(from: movie))
            }
        }
        catch{
            throw DataSourceErrors.failFetching("Fail to fetch data from service")
        }
        return Observable.just(popularMovies)
    }
    
    
    
}
