//
//  ViewController.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 6.12.2021.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    


 

    var yemeklerListe = [Yemekler]()
    var filterData = [Yemekler]()


    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?



    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self

   
        
  

        
        AnasayfaRouter.createModule(ref: self)

      
    }

    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
  
        
    
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let yemek = sender as? Yemekler
            let gidilecekVC = segue.destination as! YemekDetayVC
            gidilecekVC.yemek = yemek
        }
    }

}


//Anasayfaya geri döndüğümüzde çalışır




extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    
    
    
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
              self.filterData = yemeklerListesi
              DispatchQueue.main.async {
                  self.tableView.reloadData()
              }
    }
}


extension AnasayfaVC : UISearchBarDelegate{
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
   
        yemeklerListe = filterData.filter{ yemekler in
            if yemekler.yemek_adi!.lowercased().contains(searchText.lowercased()){
         
                return true
            }
            
            if searchText == ""{
                print("fşldklk")
                return true
               
            }
            
            return false
        }
        self.tableView.reloadData()
    }
}

       // anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
        
        // item should NOT be included
           // filteredData = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
                // If dataItem matches the searchText, return true to include it
               // return dataString.range(of: searchText, options: .caseInsensitive) != nil
           // })

          //  tableView.reloadData()
        
      //  var yemeknamesArr = [String]()
        //   for yemek in yemeklerListe {
        //       yemeknamesArr.append(yemek.yemek_adi!)
         //  }
         //  searchItem = yemeknamesArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
           //searching = true
          // tableView.reloadData()
        
    



extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return yemeklerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kategoriHucre", for: indexPath) as! KategoriHucre
        
        hucre.yemekLabel.text = "\(yemek.yemek_adi!)"
        hucre.yemekImage.image = UIImage(named: yemek.yemek_resim_adi!)
        
        hucre.layer.borderColor = UIColor.darkGray.cgColor
        hucre.layer.borderWidth = 5
        hucre.layer.cornerRadius = 20.0
     

        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        

        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            
            let yemek = self.yemeklerListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in
                
            }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anasayfaPresenterNesnesi?.sil(yemek_id: Int(yemek.yemek_id!)!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}



