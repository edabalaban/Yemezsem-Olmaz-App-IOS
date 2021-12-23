//
//  SepeteEkleInteractor.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 10.12.2021.
//

import Foundation
import Alamofire
import CoreText

class SepeteEkleInteractor : PresenterToInteractorSepeteEkleProtocol {
 
    

    var sepeteEklePresenter: InteractorToPresenterSepeteEkleProtocol?
    
    
    

      
  /*
    func yemekleriAl(kullanici_adi:String) {
        let params:Parameters = ["kullanici_adi":"eda-balaban"]
      AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).responseJSON{ response in
            
          
          if let data = response.data {
              do{
                  if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    
                     // self.yemekleriAl(kullanici_adi: "eda-balaban")
                    
                      print(json)
                  }
              }catch{
                  print(error.localizedDescription)
              }
            }
            
        }
    }
    */
    
    
    func yemekleriAl(kullanici_adi:String) {
        let params:Parameters = ["kullanici_adi":"eda-balaban"]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).responseJSON{ response in
            
          
          if let data = response.data {
 
           
              do{
                
                  let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                 //let cevap = try! JSONDecoder().decode([SepetYemeklerCevap].self, from:data)
      
           
           
                  var liste = [SepetYemekler]()
                 
        
                  if let gelenListe = cevap.sepet_yemekler{
                
       
                   liste = gelenListe
                  
                      
                   print(liste)
           
                 
                     
                  }
        
                 self.sepeteEklePresenter?.presenteraVeriGonder(yemeklerListeSepet: liste)
                  
              }catch{
                  print(error.localizedDescription)
              }
            }
            
        }
    }
    
    
    

    
    func yemekSil(sepet_yemek_id: Int,kullanici_adi:String) {

        let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":"eda-balaban"]
            
            AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).responseJSON{ response in
                
                if let data = response.data {
                    do{
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                          // print(json)
                            self.yemekleriAl(kullanici_adi:"eda-balaban")
                            //print(json)
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
                
            }
        
    }
}
