//
//  ArticleRemoteDataSourceProtocol.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation
protocol NewsRemoteDataSourceProtocol {
    func getNews() async throws -> [PostApi]
}
