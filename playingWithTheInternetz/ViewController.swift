//
//  ViewController.swift
//  playingWithTheInternetz
//
//  Created by Johann Kerr on 3/6/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getMeSomeCatGifs()
    }
    
    
    func getMeSomeCatGifs() {
        let urlString = "https://www.reddit.com/r/catgifs/hot.json?limit=100"
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let unwrappedData = data {
                   // print(unwrappedData)
                    
                    
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String: Any] ?? [:]
                        
                        let dataJSON = responseJSON["data"] as? [String: Any] ?? [:]
            
                        let childrenJSON = dataJSON["children"] as? [[String: Any]] ?? [[:]]
                        
                        for child in childrenJSON {
                            guard let innerDataJSON = child["data"] as? [String: Any] else { continue }
                            if let url = innerDataJSON["url"] as? String {
                                print(url)
                            }
                        }
 
                    } catch {
                        
                    }
 
                    
                }
                
                
            })
            
            dataTask.resume()
            
            
        }
    }

   
}

