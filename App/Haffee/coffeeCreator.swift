//
//  coffeeCreator.swift
//  Haffee
//
//  Created by Rodolfo Castillo on 05/11/14.
//  Copyright (c) 2014 Rodolfo Castillo. All rights reserved.
//

import Foundation

class coffee  {
    
    var sweetness: Int = 0
    var intensity: Int = 0
    
    func moreIntens(){
        intensity += 1
        if (intensity > 5){
            intensity = 5
        }
        
    }
    func lessIntens(){
        intensity -= 1
        if (intensity < 0){
            intensity = 0
        }
        
    }
    
    func moreSweet(){
        sweetness += 1
        if (sweetness > 5){
            sweetness = 5
        }
        
    }
    func lessSweet(){
        sweetness -= 1
        if (sweetness < 0){
            sweetness = 0
        }
        
    }

    
}