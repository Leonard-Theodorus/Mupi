//
//  RemoteDataSourceProtocol.swift
//  Mupi
//
//  Created by 🐈‍⬛🐸 on 07/11/23.
//

import Foundation

protocol RemoteDataSourceProtocol{
    
    func getPopularMovies() async throws -> [Movies]
}
