//
//  BreweryListView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/31/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI

struct BreweryListView: View {
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
            //TODO: Locatin Permission? (In use only)
            // if no permission prompt for it.
            // Find locality
            // input locality in load
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
