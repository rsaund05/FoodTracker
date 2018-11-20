//
//  Meal.swift - Class defenition for primary data model of application
//  FoodTracker
//
//  Created by Robert Saunders on 2018-09-03.
//  Copyright © 2018 Rob Saunders. All rights reserved.
//

import UIKit

public class Meal{
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int){
        
        //Name must not be empty
        guard !name.isEmpty else{
            return nil
        }
        
        guard (rating >= 0)  && (rating <= 5) else {
            return nil
        }
        
        //Initialize the stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
}
