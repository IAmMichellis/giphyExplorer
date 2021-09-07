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
        if let url = URL(string: "https://api.giphy.com/v1/gifs/random?api_key=RrRpy6fMj20Uz03LWCdQppQsUSMjJUV0&tag=&rating=g") {
            let urlSession = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print("error getting random from giphy: \(error.localizedDescription)")
                }
                
                
                if let data = data {
                    DispatchQueue.main.async {
                        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                        do {
                            let giphyData = try JSONDecoder(context: context).decode(GiphyGif.self, from: data)
                            let imageFromUrl = UIImage.gifImageWithURL(giphyData.largeUrl!)
                            self.randomImageView.image = imageFromUrl
                            
                            print("is dirty befoore \(context.hasChanges)")
                            try context.save()
                            print("is dirty after \(context.hasChanges)")
                            
                            
                        }  catch {
                            print("CONTEXT DIDN'T SAVE")
                            print(error)
                        }
                        
                    }
                }
            }
            urlSession.resume()
            
        }
        
    }
}

