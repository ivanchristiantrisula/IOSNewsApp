//
//  News.swift
//  NewsApp
//
//  Created by Ivan Christian on 09/04/22.
//

import Foundation

struct News : Codable, Hashable, Equatable {
    
    var source : Source
    var author : String?
    var title : String
    var description : String?
    var url : String
    var urlToImage : String?
    var publishedAt : String
    var content : String?
}

struct Source : Codable, Hashable, Equatable{
    var name : String
}
