//
//  CreatingCofee.swift
//  ProyectoCafeAPp
//
//  Created by Rodolfo Castillo on 31/10/14.
//  Copyright (c) 2014 Rodolfo Castillo. All rights reserved.
//

import Foundation

class CreatingCofee{
    
    var intensidad:Int
    var dulzura:Int
    var crema:Bool
    
    init(intens: Int, dulz: Int, crem: Bool){
        
        self.intensidad = intens
        self.dulzura = dulz
        self.crema = crem
        
    }
    
    func toJSON ()->String{
        return ""
    }
    
}
