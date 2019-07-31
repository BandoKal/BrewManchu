//
//  BreweryListView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/31/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI


struct Segment: UIViewRepresentable {
    var items: [Any]
    
    func makeUIView(context: Context) -> UISegmentedControl {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        return control
    }
    
    func updateUIView(_ uiView: UISegmentedControl, context: Context) {}
    
}

struct BreweryListView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
            Segment(items: [BreweryLocationType.micro.rawValue.capitalized,
                                       BreweryLocationType.prewpub.rawValue.capitalized,
                                       BreweryLocationType.cidery.rawValue.capitalized,
                BreweryLocationType.restaurant.rawValue.capitalized])
            List($viewModel.breweryLocations.value) { location in
                NavigationLink(destination: BreweryDetailView(currentBrewery: location)) {
                 BreweryRowView(currentLocation: location)
                }
                
            }.navigationBarTitle(Text("Breweries"), displayMode: .automatic)
            }
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
