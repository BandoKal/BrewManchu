//
//  RowViewModel.swift
//  BrewManchu
//
//  Created by JDU9706 on 8/1/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation
import SwiftUI

final class RowViewModel: ObservableObject {
    
    @Published var image: Image = bundleImage(named: .defaultBeer)
    
    func loadImage(from urlString: String) {
        let _ = try! imagePublisherFromURLString(urlString)
            .assertNoFailure()
            .compactMap{ $0.data }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
            }, receiveValue: { data in
                self.image = Image(uiImage: UIImage(data: data)!)
            })
    }
}
