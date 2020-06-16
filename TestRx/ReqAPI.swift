//
//  ReqAPI.swift
//  TestRx
//
//  Created by Dean on 2020/6/12.
//  Copyright © 2020 Dean. All rights reserved.
//

import Foundation
import Moya

protocol ReqresInTargetType: DecodableResponseTargetType {}

// 設定一些預設值
extension ReqresInTargetType {
    var baseURL: URL { return URL(string: "https://reqres.in/api")! }
    var path: String { return "" }
    var headers: [String : String]? { return nil }
    var task: Task { return .requestPlain }

    var sampleData: Data { return Data() }
}

enum ReqresIn {

    struct GetSingleUser: ReqresInTargetType {

        typealias ResponseType = SingleUser

        var method: Moya.Method { return .get }
        var path: String { return "/users/\(id.urlEscaped)" }
        var task: Task { return .requestPlain }

        // stored properties
        private let id: String

        init(id: String) {
          self.id = id
        }

    }

    struct CreateUser: ReqresInTargetType {
        typealias ResponseType = CreateSingleUser

        var method: Moya.Method { return .post }
        var path: String { return "/users" }
        var task: Task {
            var params: [String: String] = [:]
            params["name"] = "\(name)"
            params["job"] = "\(job)"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }

        // stored properties
        private let name: String
        private let job: String

        init(name: String, job: String) {
          self.name = name
            self.job = job
        }
    }
}
