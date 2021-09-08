//
//  RandomViewController.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-03.
//

import UIKit
import CoreData

class RandomViewController: UIViewController {
    
    @IBAction func againButtonPressed(_ sender: UIButton) {
        loadRandomImage()
    }
    
    @IBOutlet weak var randomImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRandomImage()
    }
    
    func loadRandomImage() {
        Network.shared.fetchRandomGiphy() { gif, error  in
            if let error = error {
                print("NETWORK ERROR: \(error)")
                return
            }
            
            guard let gif = gif else {
                print("NO GIF OR ERROR!")
                return
            }
            
            let imageFromUrl = UIImage.gifImageWithURL(gif.largeUrl!)
            DispatchQueue.main.async {
                self.randomImageView.image = imageFromUrl
            }
        }
    }
}
