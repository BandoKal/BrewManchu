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
    case large = 300
}

struct CircleImage : View {
    var imageName: String
    var imageSize: ImageSize
    
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(maxWidth: imageSize.rawValue, maxHeight: imageSize.rawValue)
            .aspectRatio(1, contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "default-beer", imageSize: .icon)
    }
}
#endif