//
//  APIManager.swift
//  AlbumsListSample
//
//  Created by Rozi M on 20/07/22.
//

import Foundation

class APIManger {
    
    func fetchTopAlbumsList(completionHander: @escaping (AlbumsList?, Error?) -> Void) {
        let topAlbumsUrl = URL(string: Constants.getTopAlbumsEndpoint)
        guard let url = topAlbumsUrl else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data {
                do {
                    let feedResponse = try JSONDecoder().decode(AlbumsFeed.self, from: data)
                    completionHander(feedResponse.topAlbums, nil)
                } catch {
                    print("Invalid Response")
                    completionHander(nil, error)
                }
            } else {
                completionHander(nil, error)
            }
        }
        dataTask.resume()
    }
}
