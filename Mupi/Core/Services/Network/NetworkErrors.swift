//
//  NetworkErrors.swift
//  Mupi
//
//  Created by 🐈‍⬛🐸 on 06/11/23.
//

import Foundation

enum NetworkErrors : Error{
    case endpointError(String)
    
    case serverError(String)
}
