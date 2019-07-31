//
//  CTAButtonView.swift
//  BrewManchu
//
//  Created by JDU9706 on 7/31/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI

struct CTAButtonView: View {
    var title: String
    var iconName: String
    var action: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Button(action: action) {
                HStack {
                    Text(title)
                    Image(systemName: iconName)
                }
                .frame(maxWidth: .infinity, minHeight: 50.0)
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .cornerRadius(5)
            }
            }
    }
}

#if DEBUG
struct CTAButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CTAButtonView(title: "", iconName: "", action: {})
    }
}
#endif
