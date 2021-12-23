//
//  AnasayfaInteractor.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 6.12.2021.
//

import Foundation
import Alamofire



class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {

    
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    

    
    func tumYemeklerAl() {
   
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).responseJSON{ response in
            
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
            
                    var liste = [Yemekler]()
                    
         
                    if let gelenListe = cevap.yemekler {
      
                        liste = gelenListe
                        
        
                    }
                
                    
                    self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        

    }
    
    func yemekAra(aramaKelimesi: String) {

            
          
        }
    

    
 
    func yemekSil(yemek_id: Int) {
        print("\(yemek_id)! silindi")
    }
}
