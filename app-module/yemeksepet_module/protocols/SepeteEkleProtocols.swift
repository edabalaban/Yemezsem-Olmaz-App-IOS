//
//  SepeteEkleProtocols.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 10.12.2021.
//

import Foundation

protocol ViewToPresenterSepeteEkleProtocol {
    var sepeteEkleInteractor:PresenterToInteractorSepeteEkleProtocol? {get set}
    var sepeteEkleView: PresenterToViewSepeteEkleProtocol? {get set}
    
    func yemekleriYukle(kullanici_adi:String)
    
    func sil(sepet_yemek_id:Int,kullanici_adi:String)

}


protocol PresenterToInteractorSepeteEkleProtocol {
    
    var sepeteEklePresenter:InteractorToPresenterSepeteEkleProtocol? {get set}
    
    func yemekleriAl(kullanici_adi:String)
 
    func yemekSil(sepet_yemek_id:Int,kullanici_adi:String)
}


protocol InteractorToPresenterSepeteEkleProtocol {
    func presenteraVeriGonder(yemeklerListeSepet:Array<SepetYemekler>)
}

protocol PresenterToViewSepeteEkleProtocol {
    func vieweVeriGonder(yemeklerListeSepet:Array<SepetYemekler>)
}

protocol PresenterToRouterSepeteEkleProtocol {
    static func createModule(ref:YemekSepetVC)
}
