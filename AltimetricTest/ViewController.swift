//
//  ViewController.swift
//  AltimetricTest
//
//  Created by Sagar Shinde on 23/08/20.
//  Copyright © 2020 Sagar Shinde. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var listViewModel = AlbumListViewModel(handler: NetworkRequestHandler())
    override func viewDidLoad() {
        super.viewDidLoad()
        listViewModel.fetcAlbums() { (result) in
            if result {
                print("Load data")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
            }
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.listViewModel.sortBy(option: .trackName)
        case 1:
            self.listViewModel.sortBy(option: .artistName)
        case 2:
            self.listViewModel.sortBy(option: .collectioName)
            
        default:
            self.listViewModel.sortBy(option: .release)
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.listViewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let album = self.listViewModel.albums[indexPath.row]
        cell.textLabel?.text = album.trackName ?? "NA"
        cell.detailTextLabel?.text = album.artistName ?? "NA"
        return cell
    }

}

