//
//  ExtensionGameViewController.swift
//  OriginalGame
//
//  Created by TAKU on 2017/10/30.
//  Copyright © 2017年 taku. All rights reserved.
//
//ゲームの状態(初期化、リセットなど)を管理

import UIKit

extension MainViewController {
    
    internal func gameInit(){
        enemyCount = userDefaults.integer(forKey: Constans.enemyCount)
        setSE1()
        isClear = false
        weaponCount = enemyCount
        player.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        player.isHidden = false
        enemyImage.isHidden = false
        gameStatusLabel.isHidden = true
        returnBtn.isHidden = true
        returnBtn.isEnabled = false
        
        for _ in 0..<enemyCount {
            let randX:Int = Int(arc4random() % UInt32(screenWidth - 50))
            let randY:Int = Int(arc4random() % UInt32(screenHeight - 100))
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
        isClear = true
        timer.invalidate()
        player.isHidden = true
        gameStatusLabel.isHidden = false
        gameStatusLabel.text = "GAME CLEAR\nScore:\(Float(Constans.baseScore - move))"
        enemyImage.isHidden = true
        returnBtn.isHidden = false
        returnBtn.isEnabled = true
        setSounds(flag: Constans.gameClear)
        playSounds()
    }
    
    internal func gameOver(){
        if(!isClear){
            timer.invalidate()
            player.isHidden = true
            gameStatusLabel.isHidden = false
            gameStatusLabel.text = "GAME OVER"
            enemyImage.isHidden = true
            returnBtn.isHidden = false
            returnBtn.isEnabled = true
            setSounds(flag: Constans.gameOver)
            playSounds()
        }
    }
    
}
