//
//  RatingController.swift
//  LizaHomework1.3
//
//  Created by Teslenko Anastasiya on 07.08.2020.
//  Copyright © 2020 Liza Lipatova. All rights reserved.
//

import UIKit

@IBDesignable class RatingController: UIStackView {

    private var ratingButtons = [UIButton]()
     
    var rating = 0{
        didSet {
            updateButtonSelectionStates()
        }
    }
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
     
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    @IBInspectable var smileSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
     
    @IBInspectable var smileCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    //MARK: Private Methods

    
    private func setupButtons() {
        
        // Clear any existing buttons
        for button in ratingButtons {
            //Сначала он удаляет кнопку из списка представлений, управляемых представлением стека. Это говорит представлению стека, что он больше не должен вычислять размер и положение кнопки, но кнопка все еще является подпредставлением представления стека.
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        //Затем код полностью удаляет кнопку из представления стека. Наконец, после удаления всех кнопок ratingButtonsмассив очищается .
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledSmile = UIImage(named: "filledSmile", in: bundle, compatibleWith: self.traitCollection)
        let emptySmile = UIImage(named:"emptySmile", in: bundle, compatibleWith: self.traitCollection)
        let highlightedSmile = UIImage(named:"highlightedSmile", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<smileCount {
            // Create the button
            let button = UIButton()
            
            // Set the button images
            button.setImage(emptySmile, for: .normal)
            button.setImage(filledSmile, for: .selected)
            button.setImage(highlightedSmile, for: .highlighted)
            button.setImage(highlightedSmile, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: smileSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: smileSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingController.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
        
    }
     func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
        
    }
    
}

