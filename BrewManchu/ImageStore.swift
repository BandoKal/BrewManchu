//
//  ImageStore.swift
//  BrewManchu
//
//  Created by JDU9706 on 8/1/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation
import SwiftUI

enum ImageName: String {
    case defaultBeer = "default-beer"
}


func bundleImage(named name: ImageName, from bundle: Bundle = Bundle.main) -> Image {
    return Image(name.rawValue, bundle: bundle)
}

func imagePublisherFromURLString(_ urlString: String) throws -> URLSession.DataTaskPublisher {
    guard let url = URL(string: urlString) else { throw NetworkError.urlBuild }
    return URLSession.shared.dataTaskPublisher(for: url)
}
