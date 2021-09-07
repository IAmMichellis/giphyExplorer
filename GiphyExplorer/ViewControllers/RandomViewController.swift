//
//  RandomViewController.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-03.
//

import UIKit

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
        if let url = URL(string: "https://api.giphy.com/v1/gifs/random?api_key=RrRpy6fMj20Uz03LWCdQppQsUSMjJUV0&tag=&rating=g") {
            let urlSession = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("error getting random from giphy: \(error.localizedDescription)")
                }
                
                do {
                    if let data = data {
                        print(data)
                        let giphyData = try JSONDecoder().decode(GiphyGif.self, from: data)
                        print(giphyData.largeUrl)
                        
                        let imageFromUrl = UIImage.gifImageWithURL(giphyData.largeUrl)
                        DispatchQueue.main.async {
                            self.randomImageView.image = imageFromUrl
                        }
                    }
                } catch {
                    print("fail?? \(error.localizedDescription)")
                }
           
            }
            
            urlSession.resume()
        }
    }
}
