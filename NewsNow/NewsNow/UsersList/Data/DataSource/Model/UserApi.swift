//
//  UserApi.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation

struct UserApi: Decodable {
    let id: Int
    let firstname: String
    let lastname: String
    let email: String
    let birthDate: String
    let login: Login
    let address: Address
    let phone: String
    let website: String
    let company: Company
    
    struct Login: Decodable {
        let uuid: String
        let username: String
        let password: String
        let md5: String
        let sha1: String
        let registered: String
    }
    
    struct Address: Decodable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Geo
        
        struct Geo: Decodable {
            let lat: String
            let lng: String
        }
    }
    
    struct Company: Decodable {
        let name: String
        let catchPhrase: String
        let bs: String
    }
}
