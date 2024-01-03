//
//  ContentView.swift
//  NasaApp
//
//  Created by Sofo Machurishvili on 01.01.24.
//

import SwiftUI

struct ContentView: View {
    @State var searchTextField: String = ""
    @StateObject var mediaViewModel = MediaViewModel()
    
    var body: some View {
        VStack {
            TextField("Search term...", text: $searchTextField)
            
            Button {
                mediaViewModel.getData(search: searchTextField)
            } label: {
                Text("Click here")
            }
            
            Spacer()
            
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem()]) {
                        ForEach(mediaViewModel.mediaList, id: \.id) { item in
                            AsyncImage (url: URL(string: mediaViewModel.extractImageUrl(item: item))) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                } else if phase.error != nil {
                                    Image(systemName: "photo.tv")
                                } else {
                                    ProgressView()
                                }
                            }
                            
                        }
                    }
                }
                
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
