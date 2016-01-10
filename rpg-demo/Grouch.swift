//
//  Grouch.swift
//  rpg-demo
//
//  Created by Gil Aguilar on 1/10/16.
//  Copyright © 2016 toplevel. All rights reserved.
//

import Foundation

class Grouch: Enemy {
    let IMMUNE_MAX = 15
    
    //Polymorphism
    override var loot: [String] {
        return ["Tough Hide", "Grouch Coffee", "Rare Coffee Beans"]
    
    }
    
    override var type: String {
        return "Grouch"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
}
