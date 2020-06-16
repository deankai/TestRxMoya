//
//  API.swift
//  TestRx
//
//  Created by Dean on 2020/6/12.
//  Copyright © 2020 Dean. All rights reserved.
//

import Foundation
import Moya
import RxSwift

/// 預先指定response的data type
protocol DecodableResponseTargetType: TargetType {
    associatedtype ResponseType: Codable
}
public typealias HTTPHeaders = [String:String]

public typealias HTTPParamaters = [String:Any]

final public class API {
  public static let shared = API()
  private init() {}
  private let provider = MoyaProvider<MultiTarget>()


  func request<Request: DecodableResponseTargetType>(_ request: Request) -> Single<Request.ResponseType> {
    let target = MultiTarget.init(request)
    return provider.rx.request(target)
      .filterSuccessfulStatusCodes()
        .map(Request.ResponseType.self)
        .retry(5)
        .catchError { error in
            //Response
           return Single.error(error)
    }.debug()
  }
    func requestDownloadImage<Request: DecodableResponseTargetType>(_ request: Request) -> Single<Image> {
      let target = MultiTarget.init(request)
      return provider.rx.request(target)
        .filterSuccessfulStatusCodes()
        .mapImage()
        .retry(3).catchError { error in
                //Response
               return Single.error(error)
        }.debug()
    }
}

extension String {
  var urlEscaped: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }
}
