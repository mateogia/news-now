//
//  ArticleApi.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation

struct PostApi: Decodable {
    let id: Int
    let slug: String
    //let url: String
    let title: String
    let content: String
    //let image: String
    //let thumbnail: String
    let status: String
    let category: String
    let publishedAt: String
    let updatedAt: String
    let userId: Int
}

/*struct PostApiResponse: Decodable {
    let posts: [PostApi]
}
*/
