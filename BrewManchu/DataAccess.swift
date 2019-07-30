//
//  DataAccess.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation

struct Environment {
    var apiBase = "https://sandbox-api.brewerydb.com/"
    var apiVersion = "v2/"
    var apiKey = "484b3b45fd874c7f9b0e7654354ad32d"
}

var currentEnvironment = Environment()

struct Constant {
    static let apiKey = "key"
    static let localityKey = "locality"
}



enum Endpoint: String {
    case locations
}

enum NetworkError: Error {
    case unknown
    case urlBuild
    case decoding(underlying: Error)
}

func buildURL(for endpoint: Endpoint, with queries: [URLQueryItem]) -> URL? {
    let fullAPIPath = currentEnvironment.apiBase + currentEnvironment.apiVersion + endpoint.rawValue
    var components = URLComponents(string: fullAPIPath)
    
    var params = queries
    params.append(URLQueryItem(name: Constant.apiKey, value: currentEnvironment.apiKey))
    components?.queryItems = params
    return components?.url
}

func breweryLocationsPublisher(for locality: String) throws -> URLSession.DataTaskPublisher {
    guard let url = buildURL(for: .locations, with: [URLQueryItem(name: Constant.localityKey, value: locality)]) else { throw NetworkError.urlBuild}
    return URLSession.shared.dataTaskPublisher(for: url)
    
}
