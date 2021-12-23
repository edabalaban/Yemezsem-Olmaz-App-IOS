//
//  YemekSepetVC.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 6.12.2021.
//

import UIKit

class YemekSepetVC: UIViewController {

    @IBOutlet weak var tableViewSepet: UITableView!
    
    var yemeklerListeSepet = [SepetYemekler]()
    
    
    
    

    var sepeteEklePresenterNesnesi:ViewToPresenterSepeteEkleProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableViewSepet.delegate = self
        tableViewSepet.dataSource = self
        
        SepeteEkleRouter.createModule(ref: self)

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        sepeteEklePresenterNesnesi?.yemekleriYukle(kullanici_adi: "eda-balaban")
        
        
    }


    
    
}

extension YemekSepetVC : PresenterToViewSepeteEkleProtocol {
    
    func vieweVeriGonder( yemeklerListeSepet: Array<SepetYemekler>) {
        self.yemeklerListeSepet = yemeklerListeSepet


        DispatchQueue.main.async {

            self.tableViewSepet.reloadData()
        }
        
    }
}
extension YemekSepetVC : UITableViewDelegate,UITableViewDataSource {
    
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return yemeklerListeSepet.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListeSepet[indexPath.row]
      

        let hucre = tableViewSepet.dequeueReusableCell(withIdentifier: "SepetHucre", for: indexPath) as! SepetTableViewCell
        
        hucre.yemekIsımLabel.text = "\(yemek.yemek_adi!)"
        hucre.yemekFiyatLabel.text = "\(yemek.yemek_fiyat!)₺"
        hucre.yemekAdetLabel.text = "\(yemek.yemek_siparis_adet!)"
        hucre.yemekStepperValue.text = "\(yemek.yemek_siparis_adet!)"
        hucre.yemekImage.image = UIImage(named: yemek.yemek_resim_adi!)
  
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 5
        hucre.layer.cornerRadius = 20.0
     

        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        

        
  
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sepetyemek = yemeklerListeSepet[indexPath.row]

  
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        

    }
    
    
    

    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            
            let sepetyemek = self.yemeklerListeSepet[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(sepetyemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in
                
            }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.sepeteEklePresenterNesnesi?.sil(sepet_yemek_id:Int(sepetyemek.sepet_yemek_id!)!, kullanici_adi: "eda-balaban")
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    

        
}







