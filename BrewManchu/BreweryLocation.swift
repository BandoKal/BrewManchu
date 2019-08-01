//
//  BreweryLocation.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation

struct BreweryImages: Decodable {
    var icon: String
    var medium: String
    var large: String
}

struct Brewery: Decodable {
    var name: String
    var nameShortDisplay: String
    var description: String
    var website: String
    var established: String
    var images: BreweryImages
}

enum BreweryLocationType: String {

    case all
    case micro
    case macro
    case nano
    case prewpub
    case production
    case office
    case tasting
    case restaurant
    case cidery
    case meadery
}

extension BreweryLocationType: Identifiable {
    var id: ObjectIdentifier {
        ObjectIdentifier(BreweryLocationType.self)
    }
}

struct BreweryLocation: Decodable, Identifiable {
    
    var id: String
    var streetAddress: String
    var postalCode: String
    var locality: String
    var region: String
    var locationTypeDisplay: String
    var openToPublic: String
    var hoursOfOperation: String
    var locationType: String
    var brewery: Brewery
    
    var latitude: Double
    var longitude: Double
    
}

//API returns some top level metadata in JSON response
struct LocationsResponseData: Decodable {
    var data: [BreweryLocation]
}
