//
//  Model.swift
//  gameNews
//
//  Created by Ignacio Bogarin on 09/04/22.
//

import Foundation

struct Games:Codable {
    var games:[Game]
}

struct Resultados:Codable {
    var results:[Game]
}

struct Game:Codable, Hashable {
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:VideoUrl
    var galleryImages:[String]
}

struct VideoUrl:Codable, Hashable {
    var mobile:String
    var tablet:String
}
