//
//  ItemTableViewCell.swift
//  LizaHomework1.3
//
//  Created by Teslenko Anastasiya on 02.08.2020.
//  Copyright © 2020 Liza Lipatova. All rights reserved.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
    //MARK:Сonnect nib file
    static let identifier = "ItemTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ItemTableViewCell", bundle: nil)
    }
    //MAPK:Properties
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var nameItemLabel: UILabel!
    
    @IBOutlet weak var PriceLabel: UILabel!
    
  
    
    
    var setShopItem: Shop! {
        //didSet fires when the new value has already been set! here you can access both the already set value and the old one using the oldValue variable
        didSet {
            avatarImage.image = setShopItem.avatar
            nameItemLabel.text = setShopItem.itemName
            PriceLabel.text = String(setShopItem.price)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureImage()
    }

    private func configureImage() {
        avatarImage.layer.cornerRadius = 20
    }

}
