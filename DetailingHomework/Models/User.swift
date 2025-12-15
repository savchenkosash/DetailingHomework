//
//  User.swift
//  DetailingHomework
//
//  Created by alexander on 15.12.25.
//

import Foundation

// MARK: - Domain model
struct User: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let surname: String
    let age: Int?
    let cars: [CarModel]

    init(
        id: String = UUID().uuidString,
        name: String,
        surname: String,
        age: Int? = nil,
        cars: [CarModel]
    ) {
        self.id = id
        self.name = name
        self.surname = surname
        self.age = age
        self.cars = cars
    }
}


extension User {
    static var mock: User {
        mocks[0]
    }

    static var mocks: [User] {
        [
            User(
                id: "user1",
                name: "Alex",
                surname: "Savchenko",
                age: 32,
                cars: CarModel.mocks
            )
        ]
    }
}
