//
//  MediaViewModel.swift
//  NasaApp
//
//  Created by Sofo Machurishvili on 01.01.24.
//

import SwiftUI
import NetworkService

class MediaViewModel: ObservableObject {
    @Published var mediaList: [MediaItem] = []
    
    func getData(search: String) {
        Task {
            do {
                let url = "https://images-api.nasa.gov/search?q=\(search)"
                if let response: MediaResponse = try await NetworkService.shared.getData(fromUrl: url) {
                    mediaList = response.collection.items
                }
            } catch {
                print(error)
            }
        }
    }
    
    func extractImageUrl(item: MediaItem) -> String {
        item.links?[0].href ?? ""
    }
}
