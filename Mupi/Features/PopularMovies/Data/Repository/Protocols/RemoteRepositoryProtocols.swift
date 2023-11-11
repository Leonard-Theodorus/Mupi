//
//  RemoteRepositoryProtocols.swift
//  Mupi
//
//  Created by 🐈‍⬛🐸 on 07/11/23.
//

import Foundation
import RxSwift

protocol RemoteRepositoryProtocol{
    
    func preparePopularMoviesForDomain() -> [Movie]
    
}
