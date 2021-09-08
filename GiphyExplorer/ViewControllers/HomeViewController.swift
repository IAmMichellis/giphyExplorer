//
//  HomeViewController.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-06.
//

import UIKit

class HomeViewController: UIViewController {
    
    struct LocalK {
        static let showRandomSegue = "showRandomSegue"
        static let showHistorySegue = "showHistorySegue"
    }
    
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    
    var selectedNavigationButton: UIButton?
    var collapseDetailViewController: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    fileprivate func doDetailNavigation() {
        showSelectedNavigation()
        
        self.collapseDetailViewController = false
        if selectedNavigationButton === randomButton {
            self.performSegue(withIdentifier: LocalK.showRandomSegue, sender: self)
        } else if selectedNavigationButton === historyButton {
            self.performSegue(withIdentifier: LocalK.showHistorySegue, sender: self)
        }
    }
    
    func showSelectedNavigation() {
        randomButton.isSelected = selectedNavigationButton === randomButton
        historyButton.isSelected = selectedNavigationButton === historyButton
    }
    
    @IBAction func navigationButtonSelected(_ sender: UIButton) {
        selectedNavigationButton = sender
        doDetailNavigation()
    }
}
