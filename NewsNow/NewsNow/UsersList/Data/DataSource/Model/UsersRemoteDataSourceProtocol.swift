//
//  UsersRemoteDataSourceProtocol.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation
protocol UsersRemoteDataSourceProtocol {
    func getUsers() async throws -> [UserApi]
}
