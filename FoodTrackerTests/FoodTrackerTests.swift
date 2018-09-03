//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Rob Saunders on 2018-07-26.
//  Copyright © 2018 Rob Saunders. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //MARK: Meal class tests
    
    //Confirm that the Meal class initializer returns a valid object when passed valid params
    func testMealInitializationSuccess(){
        
        //Zero Rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //Max rating (5)
        let maxRatingMeal = Meal.init(name: "Five", photo: nil, rating: 5)
        XCTAssertNotNil(maxRatingMeal)
    }
    
    //Confirm that the Meal initializer returns nil when given invalid parameters (Negative ratings or no name)
    func testMealInitializationFails(){
        
        //Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        //No name
        let noNameMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(noNameMeal)
        
        //Rating exceeds maximum
        let exceedRatingMeal = Meal.init(name: "Exceeds", photo: nil, rating: 6)
        XCTAssertNil(exceedRatingMeal)
        
    }
    
}
