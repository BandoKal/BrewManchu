//
//  BreweryListView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/31/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI

let supportedFilters = [BreweryLocationType.all,
                        BreweryLocationType.micro,
                        BreweryLocationType.prewpub,
                        BreweryLocationType.cidery,
                        BreweryLocationType.restaurant]

struct BreweryListView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @State var filterKey = "all"
    
    var body: some View {
        return NavigationView {
            VStack {
                
                Picker("", selection: $filterKey) {
                    ForEach(supportedFilters) {
                        Text($0.rawValue.capitalized)
                    }
                }.pickerStyle(SegmentedPickerStyle())
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
