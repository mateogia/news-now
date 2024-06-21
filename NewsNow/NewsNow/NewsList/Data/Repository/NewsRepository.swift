//
//  NewsRepository.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation

class NewsRepository: NewsRepositoryProtocol {
    var dataSource: NewsRemoteDataSourceProtocol
        
    init(dataSource: NewsRemoteDataSourceProtocol = NewsRemoteDataSource()) {
        self.dataSource = dataSource
    }
    
    func fetchNews() async throws -> [Post] {
        let articleDTOs = try await dataSource.getNews()
        return articleDTOs.map { Post(id: $0.id, slug: $0.slug, /*url: $0.url,*/ title: $0.title, content: $0.content, /*imageUrl: $0.image, thumbnailUrl: $0.thumbnail,*/ status: $0.status, category: $0.category, publishedAt: $0.publishedAt, updatedAt: $0.updatedAt, userIdentifier: $0.userId) }
    }
}
