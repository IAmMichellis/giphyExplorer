//
//  HistoricalGifCell.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-07.
//

import UIKit

class HistoricalGifCell: UITableViewCell {

    @IBOutlet weak var gifImageView: UIImageView!
    var gif: GiphyGif?
    
    func showGif(gif: GiphyGif) {
        gifImageView.image = nil
        self.gif = gif
        DispatchQueue.global(qos: .background).async {
            let animatedGif = UIImage.gifImageWithURL(gif.largeUrl!) // TODO dangerous, not production ready
            DispatchQueue.main.async {
                if (self.gif === gif) {
                    self.gifImageView.image = animatedGif
                }
            }
        }
    }
}
