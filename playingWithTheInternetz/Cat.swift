//
//  Cat.swift
//  playingWithTheInternetz
//
//  Created by Johann Kerr on 3/6/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation

struct CatGif {
    var title: String
    var url: String

    
    init(title: String, url: String) {
        self.title = title
        self.url = url
        
    }
    
    
//    
    init(dict: [String: Any]) {
        
        if let url = dict["url"] as? String {
            self.url = url
        } else {
            self.url = ""
        }
        if let title = dict["title"] as?  String {
            self.title = title
        } else {
            self.title = ""
        }
        
    }
    
    func meow() {
        print("\(title) - \(url)")
        
    }
}
