//
//  HistoricalGifCell.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-07.
//

import UIKit

class HistoricalGifCell: UITableViewCell {

    @IBOutlet weak var gifImageView: UIImageView!
    
    func showGif(gif: GiphyGif) {
        // TODO what's the implications of the load time? going to have wrong images. TODO.
        let animatedGif = UIImage.gifImageWithURL(gif.largeUrl!) // TODO dangerous, not production ready
        gifImageView.image = animatedGif
    }
}
