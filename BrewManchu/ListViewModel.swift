//
//  ListViewModel.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI
import Combine
import MapKit

final class ListViewModel: ObservableObject {
    
    @Published var breweryLocations = [BreweryLocation]()
    
    func coordinates(for breweryLocation: BreweryLocation) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: breweryLocation.latitude, longitude: breweryLocation.longitude)
    }
    
    func loadLocations(for locality: String) {
        let _ = try! breweryLocationsPublisher(for: locality)
            .assertNoFailure()
            .compactMap{ $0.data }
            .decode(type: LocationsResponseData.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
            }) {
                self.breweryLocations = $0.data
        }
    }
}

