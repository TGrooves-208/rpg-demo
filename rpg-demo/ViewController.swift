//
//  ViewController.swift
//  rpg-demo
//  Will need to create classes for Character, Player, and then Enemies
//  Some of the classes will also need to be overridden in order to
//  obtain the desired results from a users button pressing.
//  Created by Gil Aguilar on 1/10/16.
//  Copyright © 2016 toplevel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var enemyHpLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "NoMamesWey", hp: 110, attackPwr: 20)
        
        //If you do not create a random enemy your app will crash
        generateRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
        
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Grouch(startingHp: 50, attackPwr: 12)
        } else {
            enemy = CoffeeDevil(startingHp: 60, attackPwr: 15)
        }
        
        enemyImg.hidden = false
    }
    
    
    
    @IBAction func onChestTapped(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
    }
    

    @IBAction func attackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "That attack was wack!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
    }

}















