//
//  BreweryListView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/31/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI

let supportedFilters = [BreweryLocationType.all.rawValue,
                        BreweryLocationType.micro.rawValue,
                        BreweryLocationType.prewpub.rawValue,
                        BreweryLocationType.cidery.rawValue,
                        BreweryLocationType.restaurant.rawValue]

struct BreweryListView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @State var filterKey = "all"
    
    var body: some View {
        return NavigationView {
            VStack {
                
                Picker("Heya", selection: $filterKey) {
                    ForEach(supportedFilters) {
                        Text($0.capitalized)
                    }
                    }.pickerStyle(SegmentedPickerStyle())
//                SegmentedView(items: supportedFilters.map { $0.rawValue.capitalized }, $filterKey)
                List($viewModel.breweryLocations.value) { location in
                    if self.filterKey == "all" ||  self.filterKey == location.locationType {
                        NavigationLink(destination: BreweryDetailView(currentBrewery: location)) {
                            BreweryRowView(currentLocation: location)
                        }
                    }
                    
                }.navigationBarTitle(Text("Breweries"), displayMode: .automatic)
            }.padding()
        }
        .onAppear {
            self.viewModel.loadLocations(for: "Nashville")
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
