//
//  ContentView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel = ViewModel()
    var body: some View {
        viewModel.loadLocations(for: "Nashville")
        return Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
