//
//  UsersRepository.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation

class UsersRepository: UsersRepositoryProtocol {
    var dataSource: UsersRemoteDataSourceProtocol
        
    init(dataSource: UsersRemoteDataSourceProtocol = UsersRemoteDataSource()) {
        self.dataSource = dataSource
    }
    
    func fetchUsers() async throws -> [User] {
        let userDTOs = try await dataSource.getUsers()
        return userDTOs.map { userDTOs in
            let address = Address(
                street: userDTOs.address.street,
                suite: userDTOs.address.suite,
                city: userDTOs.address.city,
                zipcode: userDTOs.address.zipcode,
                geo: Geo(lat: userDTOs.address.geo.lat, lng: userDTOs.address.geo.lng))
            return User(
                id: userDTOs.id,
                firstname: userDTOs.firstname,
                lastname: userDTOs.lastname,
                email: userDTOs.email,
                birthDate: userDTOs.birthDate,
                address: address,
                phone: userDTOs.phone)
        }
    }
}
