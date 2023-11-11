//
//  Request.swift
//  Mupi
//
//  Created by 🐈‍⬛🐸 on 06/11/23.
//

import Foundation
import Alamofire

struct Request{
    static var headers : [String : String] = [:]
    var endpoint : Endpoint
    var queryComponent : URLQueryItem?
    var method : HTTPMethod
    
    static func configureHeaders(){
        self.headers = [
            "Content-Type" : "application/json",
            "Connection" : "keep-alive",
            "Authorization" : "Bearer \(Secrets.key)"
        ]
    }
    init(endpoint: Endpoint, queryComponent: URLQueryItem? = nil, method: HTTPMethod) {
        self.endpoint = endpoint
        self.queryComponent = queryComponent
        self.method = method
    }
    
    func makeRequest(query : [URLQueryItem]? = nil) -> URLRequest?{
        guard var url = URL(string: endpoint.rawValue) else {return nil}
        if let query{
            url.append(queryItems: query)
        }
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.allHTTPHeaderFields = Request.headers
        request.method = self.method
        return request
    }
}
