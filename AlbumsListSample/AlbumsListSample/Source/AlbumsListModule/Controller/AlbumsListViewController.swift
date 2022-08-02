//
//  ViewController.swift
//  AlbumsListSample
//
//  Created by Rozi M on 20/07/22.
//

import UIKit

class AlbumsListViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var albumsList: [Album]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    func initialSetUp() {
        activityIndicator.startAnimating()
        tableView.register(UINib(nibName: Constants.albumCellNibName, bundle: nil), forCellReuseIdentifier: Constants.albumCellIdetifier)
        fetchAlbums()
    }
    
    func fetchAlbums() {
        APIManger().fetchTopAlbumsList { [weak self] (items, error) in
            if error == nil && items != nil {
                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicator.isHidden = true
                    self?.titleLabel.text = items?.title
                    self?.albumsList = items?.topAlbumsList
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

extension AlbumsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.albumCellIdetifier) as! AlbumTableViewCell
        if let album = albumsList?[indexPath.row] {
            cell.configureCell(with: album.title, artistName: album.artistName, thumbnailUrl: album.thumbnailUrl)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

