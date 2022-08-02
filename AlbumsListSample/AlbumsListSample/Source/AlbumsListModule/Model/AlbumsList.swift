//
//  TopAlbums.swift
//  AlbumsListSample
//
//  Created by Rozi M on 20/07/22.
//

import Foundation

struct AlbumsFeed: Codable {
    var topAlbums: AlbumsList
    
    enum CodingKeys: String, CodingKey {
        case topAlbums = "feed"
    }
}

struct AlbumsList: Codable {
    
    var title: String
    var topAlbumsList: [Album]
    
    enum CodingKeys: String, CodingKey {
        case title
        case topAlbumsList = "results"
    }
}

struct Album: Codable {

    var artistName: String
    var title: String
    var thumbnailUrl: String

    enum CodingKeys: String, CodingKey {
        case artistName
        case title = "name"
        case thumbnailUrl = "artworkUrl100"
    }
}
