//
//  ArticleRemoteDataSource.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation

class NewsRemoteDataSource: NewsRemoteDataSourceProtocol {
    func getNews() async throws -> [PostApi] {
        guard let url = URL(string: "https://jsonplaceholder.org/posts") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode([PostApi].self, from: data)
        return response
    }
}
