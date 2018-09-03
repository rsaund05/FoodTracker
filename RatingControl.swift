//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Rob Saunders on 2018-08-12.
//  Copyright © 2018 Rob Saunders. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet{
            setupButtons()
        }
    }
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder){
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Private Methods
    private func setupButtons(){
        //Removing any existing buttons
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        //Load button images
        let bundle = Bundle(for:type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        //button creatinon loop
        for _ in 0..<5{
            //Create 5 buttons in loop
            let button = UIButton()
            
            //Set button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            //Create constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
            //Add button to the stack
            addArrangedSubview(button)
            
            //Add newly created button to the list of buttons
            ratingButtons.append(button)
        }
    }
    
    //MARK: Button Actions
    @objc func ratingButtonTapped(button: UIButton){
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingbutton array: \(ratingButtons)") //Error handling!
        }
        //calculate the rating of the selected button
        let selectedRating = index + 1
        if selectedRating == rating{
            //if the selected star represents the current rating, reset the rating to 0
            rating = 0
        } else {
            //Otherwise set the rating to the selected star
            rating = selectedRating
        }
        
    }
    private func updateButtonSelectionStates(){
        for(index, button) in ratingButtons.enumerated(){
            //If the index of a button is less than the rating, that button should be selected
            button.isSelected = index < rating
        }
    }
    
    
}
