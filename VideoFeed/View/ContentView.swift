//
//  ContentView.swift
//  VideoFeed
//
//  Created by Nick Pavlov on 5/18/23.
//

import SwiftUI
import PhotosUI
import AVKit

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(vm.videos) { video in
                    VideoPlayer(player: AVPlayer(url: URL(string: video.videoUrl)!))
                        .frame(height: 250)
                }
            }
            .refreshable {
                Task { try await vm.fetchVideos() }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    PhotosPicker(selection: $vm.selectedItem, matching: .any(of: [.videos, .not(.images)])) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
