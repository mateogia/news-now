//
//  User.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation

struct User: Identifiable {
    let id: Int
    let firstname: String
    let lastname: String
    let email: String
    let birthDate: String
    let address: Address
    let phone: String
}

struct Address {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo {
    let lat: String
    let lng: String
}
