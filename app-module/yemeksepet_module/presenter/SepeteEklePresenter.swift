//
//  SepeteEklePresenter.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 10.12.2021.
//

import Foundation
class SepeteEklePresenter : ViewToPresenterSepeteEkleProtocol {

    

    var sepeteEkleView: PresenterToViewSepeteEkleProtocol?
    var sepeteEkleInteractor: PresenterToInteractorSepeteEkleProtocol?
    
    func yemekleriYukle(kullanici_adi:String) {
        sepeteEkleInteractor?.yemekleriAl(kullanici_adi: "eda-balaban")
    }
    

  
    func sil(sepet_yemek_id: Int,kullanici_adi:String) {
        sepeteEkleInteractor?.yemekSil(sepet_yemek_id:sepet_yemek_id,kullanici_adi: "eda-balaban")
    }
    
    
    
}
extension SepeteEklePresenter : InteractorToPresenterSepeteEkleProtocol {
    func presenteraVeriGonder( yemeklerListeSepet: Array<SepetYemekler>) {
        sepeteEkleView?.vieweVeriGonder( yemeklerListeSepet: yemeklerListeSepet)
    }
}


