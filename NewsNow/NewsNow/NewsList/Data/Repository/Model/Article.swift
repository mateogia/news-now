//
//  Article.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation

struct Post: Identifiable {
    let id: Int
    let slug: String
    //let url: String
    let title: String
    let content: String
    //let imageUrl: String?
    //let thumbnailUrl: String?
    let status: String
    let category: String
    let publishedAt: String
    let updatedAt: String
    let userIdentifier: Int
}
