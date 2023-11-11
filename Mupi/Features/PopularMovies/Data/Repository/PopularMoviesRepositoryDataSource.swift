//
//  PopularMoviesRepositoryDataSource.swift
//  Mupi
//
//  Created by 🐈‍⬛🐸 on 07/11/23.
//

import Foundation

extension PopularMoviesRepository{
    var dataSource : RemoteDataSourceProtocol{
        PopularDataSource()
    }
}
