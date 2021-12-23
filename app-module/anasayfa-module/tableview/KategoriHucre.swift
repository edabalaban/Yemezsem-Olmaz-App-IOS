//
//  KategoriHucre.swift
//  YemekSiparisApp
//
//  Created by Eda Balaban on 6.12.2021.
//

import UIKit

class KategoriHucre: UITableViewCell {
    
    @IBOutlet weak var hucreArkaPlan: UIView!
    @IBOutlet weak var yemekImage: UIImageView!
    
    @IBOutlet weak var yemekLabel: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2))
    }

}
