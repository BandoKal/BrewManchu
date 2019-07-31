//
//  ContentView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        return Text($viewModel.breweryLocations.first?.wrappedValue.brewery.name ?? "Heya")
            .onAppear {
                self.viewModel.loadLocations(for: "Nashville")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
