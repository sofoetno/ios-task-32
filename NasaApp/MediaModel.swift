//
//  MediaModel.swift
//  NasaApp
//
//  Created by Sofo Machurishvili on 01.01.24.
//

import SwiftUI

struct MediaResponse: Decodable {
    let collection: MediaCollection
}

struct MediaCollection: Decodable {
    let items: [MediaItem]
}

struct MediaItem: Decodable, Identifiable {
    var id: String = UUID().uuidString
    let links: [MediaLink]?
    
    enum CodingKeys: String, CodingKey {
        case links
    }
}

struct MediaLink: Decodable {
    let href: String
}
