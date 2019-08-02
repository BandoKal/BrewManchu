//
//  DetailViewModel.swift
//  BrewManchu
//
//  Created by JDU9706 on 8/1/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation
import SwiftUI

final class DetailViewModel: ObservableObject, ImageModel {
    
    @Published var largeImage: Image = bundleImage(named: .defaultBeer)
    
    func processReceiveValue(_ data: Data) {
        guard let image = UIImage(data: data) else { return }
        largeImage = Image(uiImage: image)
    }
}
