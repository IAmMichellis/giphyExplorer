//
//  HistoryViewController.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-07.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    static let cellReuseIdentifier = "historicalGifCell"
    
    var historicalGifs: [GiphyGif] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        loadRandomImage()
    }
    
    // TODO remove, should be getting from core data
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
                        self.historicalGifs = [giphyData]
                        self.tableView.reloadData()
                    }
                } catch {
                    print("fail?? \(error.localizedDescription)")
                }
           
            }
            
            urlSession.resume()
        }
    }
    
}

// MARK: - UITableViewDataSource
extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historicalGifs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryViewController.cellReuseIdentifier) as! HistoricalGifCell
        cell.showGif(gif: historicalGifs[indexPath.row])
        return cell
    }
}
