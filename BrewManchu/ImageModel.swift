//
//  ImageModel.swift
//  BrewManchu
//
//  Created by JDU9706 on 8/1/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation


protocol ImageModel {
    func processReceiveValue(_ data: Data)
    func loadImage(from urlString: String)
}
extension ImageModel {
    func loadImage(from urlString: String) {
        let _ = try! imagePublisherFromURLString(urlString)
            .assertNoFailure()
            .compactMap{ $0.data }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
            }, receiveValue: processReceiveValue)
    }
}
