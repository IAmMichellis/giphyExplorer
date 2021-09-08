//
//  HistoryViewController.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-07.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    static let cellReuseIdentifier = "historicalGifCell"
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var historicalGifs: [GiphyGif] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadImages()
    }
    
    func loadImages() {
        let request : NSFetchRequest<GiphyGif> = GiphyGif.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key:"createdAt", ascending:false)]
        request.fetchLimit = 20
        DispatchQueue.main.async {
            do {
                self.historicalGifs = try self.context.fetch(request)
                self.tableView.reloadData()
            } catch {
                print("fetch error")
                print(error)
            }
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
