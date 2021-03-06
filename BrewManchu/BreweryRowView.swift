//
//  BreweryRowView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/31/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI

struct BreweryRowView : View {
    var currentLocation: BreweryLocation
    @ObservedObject var rowViewModel = RowViewModel()
    
    var body: some View {
        HStack {
            CircleImageView(image: $rowViewModel.iconImage.wrappedValue, imageSize: .icon)
            VStack(alignment: .leading) {
            Text(currentLocation.brewery.nameShortDisplay)
                .font(.headline)
            Text("Type: " + currentLocation.locationTypeDisplay)
                .font(.caption)
            }
            Spacer()
            VStack {
                Text("0.0")
                Text("Mi")
            }.padding()
        }
        .onAppear {
            self.rowViewModel.loadImage(from: self.currentLocation.brewery.images.icon)
        }
    
    }
}

#if DEBUG
struct BreweryRowView_Previews : PreviewProvider {
    static var previews: some View {
        let loc = BreweryLocation(id: UUID().uuidString, streetAddress: "701 8th Avenue South", postalCode: "37203", locality: "Nashville", region: "Tennessee", locationTypeDisplay: "micro", openToPublic: "Micro Brewery", hoursOfOperation: "", locationType: "", brewery: Brewery(name: "Jackie Brewing Company", nameShortDisplay: "Jackie", description: "Jackie Brewing Company is owned by Bailey Spaulding and Robyn Virball, two young ing\\u00e9nues with an affection for beer. They met in September 2002 in the tiny Scottish village of St. Andrews, Scotland. Bailey was a Harvard student doing a semester abroad and Robyn was beginning undergrad at St. Andrews. They bonded over being put into the worst dorm for overseas orientation and teaching Danish people how to play beer pong. Though after three months Bailey went back to Cambridge, you can\'t break the bonds that are made when teaching Europeans drinking games and a true friendship was born. During the next eight years, they both graduated, Bailey went off to Vanderbilt Law School, and Robyn entered the working world, but both thought they were meant for much bigger and more alcoholic things.", website: "https://www.google.com", established: "2011", images: BreweryImages(icon: "default-beer", medium: "", large: "https://brewerydb-images.s3.amazonaws.com/brewery/p1tFbP/upload_FgvJzY-large.png")), latitude: 36.1503749, longitude: -86.779494)
        return BreweryRowView(currentLocation: loc)
    }
}
#endif
