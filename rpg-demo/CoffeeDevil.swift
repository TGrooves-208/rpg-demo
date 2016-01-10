//
//  CoffeeDevil.swift
//  rpg-demo
//
//  Created by Gil Aguilar on 1/10/16.
//  Copyright © 2016 toplevel. All rights reserved.
//

import Foundation

class CoffeeDevil: Enemy {
    
    override var loot: [String] {
        return ["Jittery Joe's Coffee", "Frothed Creamer", "Sugar", "Biscotti"]
    }
    
    override var type: String {
        return "CoffeeDevil"
    }
}