//
//  CircleImageView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/31/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI

enum ImageSize: CGFloat {
    case icon = 50
    case medium = 100
    case large = 200
}

struct CircleImageView : View {
    var image: Image
    var imageSize: ImageSize
    
    
    var body: some View {
        self.image
            .frame(width: imageSize.rawValue, height: imageSize.rawValue)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImageView_Previews : PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("default-beer"), imageSize: .icon)
    }
}
#endif
