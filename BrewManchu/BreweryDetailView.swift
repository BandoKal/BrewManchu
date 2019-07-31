//
//  BreweryDetailView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/31/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI
import MapKit

struct BreweryDetailView: View {
    var currentBrewery: BreweryLocation
    
    var body: some View {
        ScrollView{
            VStack {
            MapView(coordinate:  CLLocationCoordinate2D(latitude: currentBrewery.latitude,
                                                        longitude: currentBrewery.longitude))
                .frame(height: 300.0)
            
            CircleImageView(imageName: currentBrewery.brewery.images.large, imageSize: .large)
                .offset(y: -100)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(currentBrewery.brewery.name)
                    .font(.title)
                Text(currentBrewery.brewery.description)
                    .font(.caption)
                    .lineLimit(10) //FIXME: Text not wrapping without frame height being set to something crazy, even then not wrapping all the way to line limit.
                    .frame(idealHeight: 1000)
                    
                VStack(alignment: .center, spacing: 12) {
                    CTAButtonView(title: "Directions", iconName: "location") {
                        //TODO: Use user's current coordinates
                        let directionsURL = "http://maps.apple.com/?saddr=35.6813023,139.7640529&daddr=\(self.currentBrewery.latitude),\(self.currentBrewery.longitude)"
                        guard let url = URL(string: directionsURL) else { return }
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    CTAButtonView(title: "Website", iconName: "") {
                        guard let url = URL(string: self.currentBrewery.brewery.website) else { return }
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            }
            .padding()
            
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct BreweryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let loc = BreweryLocation(id: UUID().uuidString, streetAddress: "701 8th Avenue South", postalCode: "37203", locality: "Nashville", region: "Tennessee", locationTypeDisplay: "Micro Brewery", openToPublic: "", hoursOfOperation: "", brewery: Brewery(name: "Jackie Brewing Company", nameShortDisplay: "Jackie", description: "Jackie Brewing Company is owned by Bailey Spaulding and Robyn Virball, two young ing\\u00e9nues with an affection for beer. They met in September 2002 in the tiny Scottish village of St. Andrews, Scotland. Bailey was a Harvard student doing a semester abroad and Robyn was beginning undergrad at St. Andrews. They bonded over being put into the worst dorm for overseas orientation and teaching Danish people how to play beer pong. Though after three months Bailey went back to Cambridge, you can\'t break the bonds that are made when teaching Europeans drinking games and a true friendship was born. During the next eight years, they both graduated, Bailey went off to Vanderbilt Law School, and Robyn entered the working world, but both thought they were meant for much bigger and more alcoholic things.", website: "https://www.google.com", established: "2011", images: BreweryImages(icon: "default-beer", medium: "", large: "default-beer")), latitude: 36.1503749, longitude: -86.779494)
        //        https://brewerydb-images.s3.amazonaws.com/brewery/p1tFbP/upload_FgvJzY-large.png
        return BreweryDetailView(currentBrewery: loc)
    }
}
#endif
