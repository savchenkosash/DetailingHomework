//
//  CarSpecs.swift
//  DetailingHomework
//
//  Created by alexander on 5.12.25.
//

import Foundation

enum CarImageStyle {
    case top    // вид сверху (assets: "1","2","3","4")
    case side   // вид сбоку (assets: "l1","l2","l3","l4")
}

// MARK: - Body type
enum BodyType: String, Codable, CaseIterable, Identifiable {
    case sedan, hatchback, suv, coupe, convertible, pickup, minivan, other

    var id: String { rawValue }

    var displayName: String {
        rawValue.capitalized
    }
}

extension BodyType {
    func imageName(style: CarImageStyle) -> String {
        switch style {
        case .top:
            switch self {
            case .convertible:
                return "1"
            case .hatchback, .suv:
                return "2"
            case .pickup, .minivan:
                return "3"
            case .sedan, .coupe, .other:
                return "4"
            }

        case .side:
            switch self {
            case .convertible:
                return "l1"
            case .hatchback, .suv:
                return "l2"
            case .pickup, .minivan:
                return "l3"
            case .sedan, .coupe, .other:
                return "l4"
            }
        }
    }
}
// MARK: - Domain model
struct CarModel: Identifiable, Codable, Hashable {
    let id: String
    let brand: String
    let model: String
    let year: Int
    let bodyType: BodyType
    let color: String?
    let licensePlate: String?
    let mileage: Int?

    init(
        id: String = UUID().uuidString,
        brand: String,
        model: String,
        year: Int,
        bodyType: BodyType,
        color: String? = nil,
        licensePlate: String? = nil,
        mileage: Int? = nil
    ) {
        self.id = id
        self.brand = brand
        self.model = model
        self.year = year
        self.bodyType = bodyType
        self.color = color
        self.licensePlate = licensePlate
        self.mileage = mileage
    }
}

extension CarModel {
    func imageName(style: CarImageStyle) -> String {
        bodyType.imageName(style: style)
    }
}

extension CarModel {
    static var mock: CarModel {
        mocks[0]
    }

    static var mocks: [CarModel] {
        [
            CarModel(
                id: "car1",
                brand: "Audi",
                model: "A7",
                year: 2021,
                bodyType: .sedan,
                color: "Black",
                licensePlate: "Е594МР",
                mileage: 14500
            ),
            CarModel(
                id: "car2",
                brand: "Porsche",
                model: "Macan",
                year: 2024,
                bodyType: .suv,
                color: "White",
                licensePlate: "C001CC77",
                mileage: 3300
            ),
            CarModel(
                id: "car3",
                brand: "Porcshe",
                model: "911",
                year: 2025,
                bodyType: .convertible,
                color: "Red",
                licensePlate: "E111EE777",
                mileage: 410
            ),
            CarModel(
                id: "car4",
                brand: "Dodge",
                model: "RAM",
                year: 2022,
                bodyType: .minivan,
                color: "Gray",
                licensePlate: "C001C",
                mileage: 23300
            )
        ]
    }
}
