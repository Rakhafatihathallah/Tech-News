//
//  NewsModel.swift
//  TechNewsAsync
//
//  Created by Rakha Fatih Athallah on 02/11/22.
//

import Foundation


struct NewsModel : Codable, Hashable {
    let status : String
    let totalResults : Int
    let articles : [Articles]
}

struct Articles : Codable, Hashable {
    let source : Source
    let author : String?
    let title  : String
    let description : String?
    let url : String
    let urlToImage : String?
    let publishedAt : String
    let content : String?
}

struct Source : Codable, Hashable {
    let id : String?
    let name : String
}
