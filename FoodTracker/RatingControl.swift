//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Rob Saunders on 2018-08-06.
//  Copyright © 2018 Rob Saunders. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Private Functions
    private func setupButtons(){
        let button = UIButton()
        button.backgroundColor = UIColor.red
        //Constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        //Set up button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        //Add button to stack
        addArrangedSubview(button)
        
       
        
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton){
        print("GOTEM")
    }
}
