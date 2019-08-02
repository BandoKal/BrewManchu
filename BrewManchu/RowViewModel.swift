//
//  RowViewModel.swift
//  BrewManchu
//
//  Created by JDU9706 on 8/1/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation
import SwiftUI

final class RowViewModel: ObservableObject, ImageModel {
    
    @Published var iconImage: Image = bundleImage(named: .defaultBeer)
    
    func processReceiveValue(_ data: Data) {
        guard let image = UIImage(data: data) else { return }
        iconImage = Image(uiImage: image)
    }
}

