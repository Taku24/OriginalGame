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
        screenWidth = UIScreen.main.bounds.width
        screenHeight = UIScreen.main.bounds.height
        player.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        player.isHidden = false
        enemyImage.isHidden = false
        gameStatusLabel.isHidden = true
        returnBtn.isHidden = true
        returnBtn.isEnabled = false
        
        for i in 0..<10 {
            let randX = Int(arc4random() % UInt32(screenWidth - 50))
            let randY = Int(arc4random() % UInt32(screenHeight - 100))
            let frame:CGRect = CGRect(x: randX, y: randY, width: 50, height: 50)
            let weapon:Weapon = Weapon(frame: frame)
            weaponList.append(weapon)
            self.view.addSubview(weapon)
        }
        
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.showHelpItem), userInfo: nil, repeats: true)
        timer.fire()
        
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countTime), userInfo: nil, repeats: true)
        gameTimer.fire()
    }
    
    @objc func countTime(){
        timeCount += 1
        timerLabel.text = String(timeCount)
    }
    
    internal func gameReset(){
        for weapon in weaponList {
            weapon.removeFromSuperview()
        }
        weaponList.removeAll()
        move = 0.0
        weaponCount = 10
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
