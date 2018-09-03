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
        //Initialize the stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        //Fail initialization if no name is given or if the rating is a negative value
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
