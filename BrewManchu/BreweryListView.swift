//
//  BreweryListView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/31/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI
import CoreLocation

enum LocationError: Error {
    case unableToReverseGeocodeCity
    case serviceRestrictedOrDenied
    case authStatusUnknown
    case underlyingError(Error)
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    var clManager = CLLocationManager()
    var completion: (Result<String, LocationError>) -> Void = {_ in }
    
    
    func doLocationUpdate(_ completion: @escaping (Result<String, LocationError>) -> Void) {
        self.completion = completion
        clManager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            clManager.desiredAccuracy = kCLLocationAccuracyBest
            
            let authStatus = CLLocationManager.authorizationStatus()
            switch authStatus {
            case .notDetermined:
                clManager.requestWhenInUseAuthorization()
            case .restricted, .denied:
                self.completion(.failure(.serviceRestrictedOrDenied))
            case .authorizedAlways, .authorizedWhenInUse:
                clManager.requestLocation()
            @unknown default:
                self.completion(.failure(.authStatusUnknown))
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        doLocationUpdate(self.completion)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.completion(.failure(.underlyingError(error)))
        print("Failed \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Called a few times 
        let geocoder = CLGeocoder()
        if let loc = locations.last {
            geocoder.reverseGeocodeLocation(loc) { (placemarks, error) in
                guard let placemark = placemarks?.last,
                    let city = placemark.locality else {
                        self.completion(.failure(.unableToReverseGeocodeCity))
                        return
                }
                self.completion(.success(city))
            }
        }
    }
}

struct BreweryListView: View  {
    
    let locationManager = LocationManager()
    @ObservedObject var viewModel: ListViewModel = ListViewModel()
    
    var body: some View {
        return NavigationView {
            VStack {
                List($viewModel.breweryLocations.value) { location in
                    NavigationLink(destination: BreweryDetailView(currentBrewery: location)) {
                        BreweryRowView(currentLocation: location)
                    }
                }.navigationBarTitle(Text("Breweries"), displayMode: .automatic)
            }.padding()
        }
        .onAppear {
            self.locationManager.doLocationUpdate { result in
                switch result {
                case .success(let city):
                    self.viewModel.loadLocations(for: city)
                case .failure(let error):
                    //TODO: Prompt user for city to search or to allow location services
                    print(error)
                }
            }
        }
    }
    
    
}

#if DEBUG
struct BreweryListView_Previews: PreviewProvider {
    static var previews: some View {
        BreweryListView()
    }
}
#endif
