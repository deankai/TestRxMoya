//
//  HTTPBinAPI.swift
//  TestRx
//
//  Created by Dean on 2020/6/15.
//  Copyright © 2020 Dean. All rights reserved.
//

import Foundation
import Moya

protocol HTTPBinTargetType: DecodableResponseTargetType {}

// 設定一些預設值
extension HTTPBinTargetType {
    var baseURL: URL { return URL(string: "https://il.beauty321.com")! }
    var path: String { return "" }
    var headers: [String : String]? { return nil }
    var task: Task { return .requestPlain }

    var paramaters: HTTPParamaters? { return nil }

    var sampleData: Data { return Data() }
}

enum HTTPBin {

    struct GetImage: HTTPBinTargetType {
        typealias ResponseType = SingleUser

        var method: Moya.Method { return .get }
        var path: String { return "/gallery/articleIMG/AL_33322.jpg" }
        var task: Task { return .requestPlain }
    }
}


private let DefaultDownloadDestination: DownloadDestination = { temporaryURL, response in
    return (DefaultDownloadDir.appendingPathComponent(response.suggestedFilename!), [])
}

//默认下载保存地址（用户文档目录）
let DefaultDownloadDir: URL = {
    let directoryURLs = FileManager.default.urls(for: .documentDirectory,
                                                 in: .userDomainMask)
    return directoryURLs.first ?? URL(fileURLWithPath: NSTemporaryDirectory())
}()
