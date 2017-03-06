//
//  RandomViewController.swift
//  playingWithTheInternetz
//
//  Created by Johann Kerr on 3/6/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController {

    
    let store = CatDataStore.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let cat = getRandomCat() {
            cat.meow()
        }
        
        
    }
    
    func getRandomCat() -> CatGif? {
        if !store.catgifs.isEmpty {
            let randomCatIndex = Int(arc4random_uniform(UInt32(store.catgifs.count)))
            return store.catgifs[randomCatIndex]
        } else {
            return nil
        }
    }

   
}
