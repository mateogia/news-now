//
//  UsersRemoteDataSource.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation
class UsersRemoteDataSource: UsersRemoteDataSourceProtocol {
    func getUsers() async throws -> [UserApi] {
        guard let url = URL(string: "https://jsonplaceholder.org/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode([UserApi].self, from: data)
        return response
    }
}
