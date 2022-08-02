//
//  AlbumTableViewCell.swift
//  AlbumsListSample
//
//  Created by Rozi M on 20/07/22.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with title: String, artistName: String, thumbnailUrl: String) {
        self.title.text = title
        self.artistName.text = artistName
        let url = URL(string: thumbnailUrl)
        let data = try? Data(contentsOf: url!)
        self.thumbnail.image = UIImage(data: data!)
    }
}
