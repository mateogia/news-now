//
//  UsersRepositoryProtocol.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation

protocol UsersRepositoryProtocol {
    var dataSource: UsersRemoteDataSourceProtocol { get set }
    func fetchUsers() async throws -> [User]
}
