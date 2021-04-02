//
//  UsersModel.swift
//  UsersAppUsingViperDesign
//
//  Created by macadmin on 02/04/21.
//

import Foundation

struct User: Decodable {

    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?
}

struct Address: Decodable {

    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo

    private enum CodingKeys: String, CodingKey {
        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
        case geo = "geo"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try values.decode(String.self, forKey: .street)
        suite = try values.decode(String.self, forKey: .suite)
        city = try values.decode(String.self, forKey: .city)
        zipcode = try values.decode(String.self, forKey: .zipcode)
        geo = try values.decode(Geo.self, forKey: .geo)
    }
}

struct Geo: Decodable {

    let lat: String
    let lng: String

    private enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decode(String.self, forKey: .lat)
        lng = try values.decode(String.self, forKey: .lng)
    }
}

struct Company: Decodable {

    let name: String
    let catchPhrase: String
    let bs: String

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        catchPhrase = try values.decode(String.self, forKey: .catchPhrase)
        bs = try values.decode(String.self, forKey: .bs)
    }
}

