//
//  SeaFeature.swift
//  AnimalSeaCreatures

import Foundation

typealias Insect = [String: Value]

// MARK: - Empty
struct Value: Codable {
    let id: Int
    let name: Name
    let availability: Availability
    let price: Int
    let imageURI, iconURI: String

    enum CodingKeys: String, CodingKey {
        case id
        case name, availability, price
        case imageURI = "image_uri"
        case iconURI = "icon_uri"
    }
}

// MARK: - Availability
struct Availability: Codable {
    let location: String?
    let rarity: Rarity?
    let monthArrayNorthern, monthArraySouthern, timeArray: [Int]

    enum CodingKeys: String, CodingKey {
        case location, rarity
        case monthArrayNorthern = "month-array-northern"
        case monthArraySouthern = "month-array-southern"
        case timeArray = "time-array"
    }
}

// MARK: - Name
struct Name: Codable {
    let nameTWzh: String
    enum CodingKeys: String, CodingKey {
        case nameTWzh = "name-TWzh"
    }
}

extension Name: Hashable { }

enum Rarity: String, Codable {
    case common = "Common"
    case rare = "Rare"
    case ultraRare = "Ultra-rare"
    case uncommon = "Uncommon"
}

extension Rarity {
    func changeToChinese() -> String {
        switch self {
        case .common:
            return "普通"
        case .rare:
            return "稀有"
        case .ultraRare:
            return "非常稀有"
        case .uncommon:
            return "不普通"
        }
    }
}

