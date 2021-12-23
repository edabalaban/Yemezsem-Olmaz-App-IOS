//
//  SepetTableViewCell.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 10.12.2021.
//

import UIKit

class SepetTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var incrementButton: UIButton!
      @IBOutlet weak var decrementButton: UIButton!
      @IBOutlet weak var quantityLabel: UILabel!
    

    @IBOutlet weak var yemekAdetLabel: UILabel!
    @IBOutlet weak var yemekIsımLabel: UILabel!
    

  
    @IBOutlet weak var yemekStepperValue: UILabel!
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBOutlet weak var yemekImage: UIImageView!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
  var yemekDetay:YemekDetayVC?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func stepperKontrol(_ sender: UIStepper) {
        
        let stepperValue = Int(stepperOutlet.value)
     yemekStepperValue.text = "Adet : \(Int(stepperValue))"
            
            
        
    }
    
    
    
    @IBAction func StepperGuncelle(_ sender: Any) {
        yemekDetay?.stepperOutlet.value = stepperOutlet.value
    }
    
    
    

    
}
