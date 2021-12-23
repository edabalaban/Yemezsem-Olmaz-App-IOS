//
//  YemekDetayVC.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 10.12.2021.
//

import UIKit

class YemekDetayVC: UIViewController {

    @IBOutlet weak var stepperOutlet: UIStepper!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var yemekLabel: UILabel!
    
    @IBOutlet weak var stepperAdetLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var yemekDetayPresenterNesnesi:ViewToPresenterYemekDetayProtocol?
    
    var yemek:Yemekler?
    var sepetYemek :SepetYemekler?
  
    var yemekListe = [SepetYemekler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let y = yemek {
            self.navigationItem.title = y.yemek_adi
            yemekLabel.text="\(y.yemek_adi!)"
            imageView.image = UIImage(named: y.yemek_resim_adi!)
            priceLabel.text = "\(y.yemek_fiyat!)₺"
 
            
     
      
            
        }
        
    
        

        
   
       // if let ys = sepetYemek {
        // stepperLabel.text = "\(ys.yemek_siparis_adet)"
           
       // }
        YemekDetayRouter.createModule(ref: self)
        

        // Do any additional setup after loading the view.
    }
    
    
    func total(){
        let fiyat = Int(yemek!.yemek_fiyat!)!
        let adet = Int(stepperOutlet.value)
        let toplam = fiyat * adet
               priceLabel.text = "\(toplam)₺"
    }
    
    override func viewWillAppear(_ animated: Bool) {
   // stepperKontrol(stepperOutlet)
        total()
        
        
    }

    
    @IBAction func stepperKontrol(_ sender:  UIStepper) {
    
        stepperAdetLabel.text = "Adet: \(String(Int(sender.value)))"
     
               total()


    }
    
    

    
    @IBAction func sepeteEkle(_ sender: Any) {
        if let y = yemek{

   
           // Int(stepperOutlet.value)
            yemekDetayPresenterNesnesi?.ekle(yemek_adi:y.yemek_adi!, yemek_resim_adi: y.yemek_resim_adi!, yemek_fiyat: Int(y.yemek_fiyat!)!, yemek_siparis_adet:Int(stepperOutlet.value), kullanici_adi: "eda-balaban")
            
            
        }
        
        
        
        
        
    }
    

        
        
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
