//
//  ViewController.swift
//  TestRx
//
//  Created by Dean on 2020/6/12.
//  Copyright © 2020 Dean. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Moya

class ViewController: UIViewController {

    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        getImage()

    }


}

private extension ViewController {
    //Get
    func getSingleUser() {
        API.shared.request(ReqresIn.GetSingleUser(id: "2")).subscribe(onSuccess: { (p) in
          print(p)
        }, onError: { (e) in
          if case let MoyaError.jsonMapping(r) = e {
            print(r)
          }
          if let e = e as? MoyaError, let response : Response? = e.response, let errorMessage = try? e.response?.mapJSON() {
            print("请求错误！错误码：\(response?.statusCode ?? 0)")
            print("请求失败！错误信息：\(e.errorDescription ?? "")")
          }
        })
        .disposed(by: bag)
    }
    //Post
    func createUser() {
        API.shared.request(ReqresIn.CreateUser(name: "Dean", job: "Godzila")).subscribe(onSuccess: { (p) in
          print(p)
        }, onError: { (e) in
          if case let MoyaError.jsonMapping(r) = e {
            print(r)
          }
          if let e = e as? MoyaError, let response : Response? = e.response, let errorMessage = try? e.response?.mapJSON() {
            print("请求错误！错误码：\(response?.statusCode ?? 0)")
            print("请求失败！错误信息：\(e.errorDescription ?? "")")
          }
        })
        .disposed(by: bag)
    }
    //Get file
    func getImage() {
        API.shared.requestDownloadImage(HTTPBin.GetImage()).subscribe(onSuccess: { (image) in
          print(image)
        }, onError: { (e) in
          if case let MoyaError.jsonMapping(r) = e {
            print(r)
          }
          if let e = e as? MoyaError, let response : Response? = e.response, let errorMessage = try? e.response?.mapJSON() {
            print("请求错误！错误码：\(response?.statusCode ?? 0)")
            print("请求失败！错误信息：\(e.errorDescription ?? "")")
          }
        })
        .disposed(by: bag)
    }
}

