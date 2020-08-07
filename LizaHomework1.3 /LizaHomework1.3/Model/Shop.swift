
import UIKit

class Shop {
    let avatar: UIImage?
    let itemName: String
    let price: String

init?(avatar: UIImage?, itemName: String, price: String) {
    
    // The name must not be empty
    guard !itemName.isEmpty else {
        return nil
    }
    guard !price.isEmpty else {
        return nil
    }
    /*
    var num = Int(price)
    if num != nil {
     self.price = price
    }
    else {
     self.price = 0
    }*/
    
    // Initialize stored properties.
    self.avatar = avatar
    self.itemName = itemName
    self.price = price

    }
}
