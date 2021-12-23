//
//  YemekDetayRouter.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 10.12.2021.
//

import Foundation
class YemekDetayRouter : PresenterToRouterYemekDetayProtocol {
    static func createModule(ref: YemekDetayVC) {
        ref.yemekDetayPresenterNesnesi = YemekDetayPresenter()
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor = YemekDetayInteractor()
    }
}
