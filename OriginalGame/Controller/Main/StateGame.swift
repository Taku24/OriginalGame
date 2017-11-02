//
//  ExtensionGameViewController.swift
//  OriginalGame
//
//  Created by TAKU on 2017/10/30.
//  Copyright © 2017年 taku. All rights reserved.
//

import UIKit

extension MainViewController {
    
    internal func gameInit(){
        let defEnemyCount = userDefaults.integer(forKey: Constans.enemyCount)
        if(defEnemyCount == nil){
            enemyCount = 3
        } else {
            enemyCount = userDefaults.integer(forKey: Constans.enemyCount)
        }
        weaponCount = enemyCount
        screenWidth = UIScreen.main.bounds.width
        screenHeight = UIScreen.main.bounds.height
        player.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        player.isHidden = false
        enemyImage.isHidden = false
        gameStatusLabel.isHidden = true
        returnBtn.isHidden = true
        returnBtn.isEnabled = false
        
        for _ in 0..<enemyCount {
            let randX = Int(arc4random() % UInt32(screenWidth - 50))
            let randY = Int(arc4random() % UInt32(screenHeight - 100))
            let frame:CGRect = CGRect(x: randX, y: randY, width: 50, height: 50)
            let weapon:Weapon = Weapon(frame: frame)
            weaponList.append(weapon)
            self.view.addSubview(weapon)
        }
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    internal func gameReset(){
        for weapon in weaponList {
            weapon.removeFromSuperview()
        }
        weaponList.removeAll()
        move = 0.0
        weaponCount = enemyCount
        hp = Constans.hp
        hpProgressBar.setProgress(hp, animated: true)
    }
    
    internal func gameClear(){
        player.isHidden = true
        gameStatusLabel.isHidden = false
        gameStatusLabel.text = "GAME CLEAR\nScore:\(move)"
        enemyImage.isHidden = true
        returnBtn.isHidden = false
        returnBtn.isEnabled = true
    }
    
    internal func gameOver(){
        player.isHidden = true
        gameStatusLabel.isHidden = false
        gameStatusLabel.text = "GAME OVER"
        enemyImage.isHidden = true
        returnBtn.isHidden = false
        returnBtn.isEnabled = true
    }
    
}
