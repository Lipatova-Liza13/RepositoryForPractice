//
//  NewItemControllerViewController.swift
//  LizaHomework1.3
//
//  Created by Teslenko Anastasiya on 03.08.2020.
//  Copyright © 2020 Liza Lipatova. All rights reserved.
//

import UIKit
import os.log//This will import the unified registration system
//for button save


class NewItemViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    var shop: Shop?

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBOutlet weak var PriceTextField: UITextField!
    
    @IBOutlet weak var PhotoItem: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameTextField.delegate = self
        PriceTextField.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        NameTextField.resignFirstResponder()
        PriceTextField.resignFirstResponder()

        return true

    }
    
    
    //MARK: Navigation
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = NameTextField.text ?? ""
        let price = PriceTextField.text ?? "0"
        let photo = PhotoItem.image
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        shop = Shop(avatar: photo!, itemName: name, price: price)
        print(66)
    }

    
    
    //MARK: Action
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        NameTextField.resignFirstResponder()
        //Этот код гарантирует, что если пользователь нажимает на изображение при вводе текста в текстовое поле, клавиатура отключается правильно
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
   
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        PhotoItem.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    

    

}
