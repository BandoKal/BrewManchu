//
//  ViewModel.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI
import Combine
import MapKit

final class ViewModel: ObservableObject {
    let didChange = PassthroughSubject<ViewModel, Error>()
    
    var breweryLocations = [BreweryLocation]() {
        didSet {
            didChange.send(self)
        }
    }
    
    func coordinates(for breweryLocation: BreweryLocation) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: breweryLocation.latitude, longitude: breweryLocation.longitude)
    }
    
    func loadLocations(for locality: String) {
        
        let _ = try! breweryLocationsPublisher(for: locality)
            .compactMap{ $0.data }
            .decode(type: LocationsResponseData.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { error in
                print(error)
            }) { self.breweryLocations = $0.data }
    }
}

