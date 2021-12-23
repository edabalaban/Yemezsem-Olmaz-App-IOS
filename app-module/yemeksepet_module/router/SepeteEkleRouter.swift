//
//  SepeteEkleRouter.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 10.12.2021.
//

import Foundation
class SepeteEkleRouter : PresenterToRouterSepeteEkleProtocol {
    static func createModule(ref: YemekSepetVC) {
        let presenter : ViewToPresenterSepeteEkleProtocol & InteractorToPresenterSepeteEkleProtocol = SepeteEklePresenter()
        
        //View controller için
        ref.sepeteEklePresenterNesnesi = presenter
        
        //Presenter için
        ref.sepeteEklePresenterNesnesi?.sepeteEkleInteractor = SepeteEkleInteractor()
        ref.sepeteEklePresenterNesnesi?.sepeteEkleView = ref 
        
        //Interactor için
        ref.sepeteEklePresenterNesnesi?.sepeteEkleInteractor?.sepeteEklePresenter = presenter
        
        
    }
}
