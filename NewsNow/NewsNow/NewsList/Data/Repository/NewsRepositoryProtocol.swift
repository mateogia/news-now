//
//  NewsRepositoryProtocol.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation

protocol NewsRepositoryProtocol {
    var dataSource: NewsRemoteDataSourceProtocol { get set }
    func fetchNews() async throws -> [Post]
}
