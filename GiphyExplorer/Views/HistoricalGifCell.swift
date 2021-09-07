//
//  HistoricalGifCell.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-07.
//

import UIKit

class HistoricalGifCell: UITableViewCell {

    @IBOutlet weak var gifImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showGif(gif: GiphyGif) {
        // TODO what's the implications of the load time? going to have wrong images. TODO.
        let animatedGif = UIImage.gifImageWithURL(gif.largeUrl)
        gifImageView.image = animatedGif
    }
}
