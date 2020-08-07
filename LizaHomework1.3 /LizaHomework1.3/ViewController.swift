//
//  ViewController.swift
//  LizaHomework1.3
//
//  Created by Teslenko Anastasiya on 02.08.2020.
//  Copyright © 2020 Liza Lipatova. All rights reserved.
//

import UIKit


final class ViewController: UIViewController {
    //MAPK:Properties
    var shops = [Shop]()
    @IBOutlet weak var tableView: UITableView!
  //  @IBOutlet weak var NavigationBar: UINavigationBar!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadSampleItems()
        tableView.register(ItemTableViewCell.nib(), forCellReuseIdentifier: ItemTableViewCell.identifier)
        
        //Removes extra blank cells in the TableViewController
        tableView.tableFooterView = UIView()
       // this way I can create navigation bar without storyboard
       // navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "sun.min"), style: .plain, target: self, action: nil)
    }
    
}

    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return shops.count
        }
    
        
        //specifies the height (in points) that row should be
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
        
        
        //UIKit raises an assertion if you return nil
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            //Create your cell using the table view's
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as! ItemTableViewCell
            cell.setShopItem = shops[indexPath.row]
            return cell
        }
        
        private func loadSampleItems() {
            
            let avatar1 = UIImage(named: "Shoes")
            let avatar2 = UIImage(named: "Blouse")
            let avatar3 = UIImage(named: "Trousers")

            guard let shop1 = Shop(avatar: avatar1, itemName: "Watermelon", price: "789") else {
                fatalError("Unable to instantiate item1")
            }

            guard let shop2 = Shop(avatar: avatar2, itemName: "Blouse", price: "340") else {
                fatalError("Unable to instantiate item2")
            }

            guard let shop3 = Shop(avatar: avatar3, itemName: "Trousers", price: "40") else {
                fatalError("Unable to instantiate item3")
            }

            shops += [shop1, shop2, shop3]
        }
        
        @IBAction func unwindToShopList(sender: UIStoryboardSegue) {
               if let sourceViewController = sender.source as? NewItemViewController, let shop = sourceViewController.shop {
                   // Add a new meal.
                   let newIndexPath = IndexPath(row: shops.count, section: 0)
                   shops.append(shop)
                  tableView.insertRows(at: [newIndexPath], with: .automatic)//animation
               }
           }
           
    }



