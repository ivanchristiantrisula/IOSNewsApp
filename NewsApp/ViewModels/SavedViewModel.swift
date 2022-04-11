//
//  ReadLater.swift
//  NewsApp
//
//  Created by Ivan Christian on 09/04/22.
//

import Foundation
import Combine

class SavedViewModel: ObservableObject {
    @Published var news : [News] = []
    
    init(){
        
    }
    
    func add (item : News) {
        self.news.append(item)
    }
    
    func remove(item : News){
        
    }
    
    func loadFromDB () {
        
    }
    
    func saveToDB () {
        
    }
}
