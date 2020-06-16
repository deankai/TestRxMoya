//
//  Models.swift
//  TestRx
//
//  Created by Dean on 2020/6/12.
//  Copyright © 2020 Dean. All rights reserved.
//

import Foundation

// MARK:- SingleUser
struct SingleUser : Codable {
    let data : SingleUserData?
    let ad : SingleUserAd?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case ad = "ad"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(SingleUserData.self, forKey: .data)
        ad = try values.decodeIfPresent(SingleUserAd.self, forKey: .ad)
    }

}
struct SingleUserAd : Codable {
    let company : String?
    let url : String?
    let text : String?

    enum CodingKeys: String, CodingKey {

        case company = "company"
        case url = "url"
        case text = "text"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        company = try values.decodeIfPresent(String.self, forKey: .company)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        text = try values.decodeIfPresent(String.self, forKey: .text)
    }

}
struct SingleUserData : Codable {
    let id : Int?
    let email : String?
    let first_name : String?
    let last_name : String?
    let avatar : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case email = "email"
        case first_name = "first_name"
        case last_name = "last_name"
        case avatar = "avatar"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
    }

}
// MARK:- CreateUser
struct CreateSingleUser : Codable {
    let name : String?
    let job : String?
    let id : String?
    let createdAt : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case job = "job"
        case id = "id"
        case createdAt = "createdAt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        job = try values.decodeIfPresent(String.self, forKey: .job)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
    }

}
