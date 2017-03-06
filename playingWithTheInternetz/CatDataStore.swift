//
//  CatDataStore.swift
//  playingWithTheInternetz
//
//  Created by Johann Kerr on 3/6/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation


class CatDataStore {
    static let sharedInstance = CatDataStore()
    fileprivate init() {}
    
    var catgifs = [CatGif]()
    
    
    func getMeSomeCatGifs(completion: @escaping () -> ()) {
        self.catgifs.removeAll()
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
                            let catgif = CatGif(dict: innerDataJSON)
                            self.catgifs.append(catgif)
                            
//                            let catgif = CatGif(
//                           //let catgif = CatGif(dict: innerDataJSON)
//                            
//                            self.catgifs.append(catgif)
                        
                        }
                        
                        completion()
                        
                    } catch {
                        
                    }
                    
                    
                }
                
                
            })
            
            dataTask.resume()
            
            
        }
    }
   
    
}
