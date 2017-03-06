//
//  ViewController.swift
//  playingWithTheInternetz
//
//  Created by Johann Kerr on 3/6/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let store = CatDataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.getMeSomeCatGifs {
            self.tableView.reloadData()
        }
       
    }
    
   
    
    
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for: indexPath)
        let cat = store.catgifs[indexPath.row]
        cell.textLabel?.text = cat.url
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return store.catgifs.count
    }

   
}

