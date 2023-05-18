//
//  Video.swift
//  VideoFeed
//
//  Created by Nick Pavlov on 5/18/23.
//

import Foundation

struct Video: Identifiable, Codable {
    var id: String {
        return NSUUID().uuidString
    }
    let videoUrl: String
}
