//
//  NetworkManager.swift
//  Mupi
//
//  Created by 🐈‍⬛🐸 on 06/11/23.
//

import Foundation

final class NetworkManager{
    static let shared = NetworkManager()
    
    func makeNetworkCall<T : Codable>(request : URLRequest, type : T.Type) async throws -> T?{
        let session = URLSession.shared
        var networkError : NetworkErrors?
        var decodeError : DecodingError?
        var decoded : T?
        let jsonDecoder = JSONDecoder()
        
        let(data, response) = try await session.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse{
            switch httpResponse.statusCode{
                case 400 ..< 500: networkError = NetworkErrors.endpointError("Couldn't reach The server, please check your internet connection")
                    
                case 500 ..< 600 : networkError = NetworkErrors.serverError("Server is having a problem, try again later!")
                    
                default : networkError = nil
            }
            
        }
        do{
            decoded = try jsonDecoder.decode(type, from: data)
        }
        catch{
            decodeError = DecodingError.decodeError("Type is not in the right format")
        }
        
        if let networkError{
            throw networkError
        }
        else if let decodeError{
            throw decodeError
        }
        
        return decoded
    }
    
    func downloadImage(from URL : URL) async throws -> Data{
        let session = URLSession.shared
        
        let (data, response) = try await session.data(from: URL)
        if let httpResponse = response as? HTTPURLResponse{
            switch httpResponse.statusCode{
                case 400 ..< 500: throw NetworkErrors.endpointError("Couldn't reach The server, please check your internet connection")
                    
                case 500 ..< 600 : throw NetworkErrors.serverError("Server is having a problem, try again later!")
                    
                default :
                    break
            }
            
        }
        return data
    }
    
    
}
