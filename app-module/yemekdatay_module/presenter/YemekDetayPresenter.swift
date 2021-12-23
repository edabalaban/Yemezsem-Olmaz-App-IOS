//
//  YemekDetayPresenter.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 10.12.2021.
//

import Foundation
class YemekDetayPresenter : ViewToPresenterYemekDetayProtocol {
    func ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        yemekDetayInteractor?.sepeteEkle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: "eda-balaban")
    }
    
  

    
  
    
    var yemekDetayInteractor: PresenterToInteractorYemekDetayProtocol?
    
 
}
