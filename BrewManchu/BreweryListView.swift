//
//  BreweryListView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/31/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI

struct BreweryListView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List($viewModel.breweryLocations.value) { location in
                
                BreweryRowView(currentLocation: location)
            }.navigationBarTitle(Text("Breweries"), displayMode: .automatic)
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
