//
//  ExtentionJudgeIntersectViewController.swift
//  OriginalGame
//
//  Created by TAKU on 2017/10/29.
//  Copyright © 2017年 taku. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func judgeIntersects(){
        judgeWall()
        judgeEnemy()
        judgeHelpItem()
    }
    
    private func judgeWall(){
        let isTop = player.frame.intersects(topWall.frame) ? true : false
        let isBottom = player.frame.intersects(bottomWall.frame) ? true : false
        let isLeft = player.frame.intersects(leftWall.frame) ? true : false
        let isRight = player.frame.intersects(rightWall.frame) ? true : false
        if(isTop || isBottom || isLeft || isRight){
            gameOver()
        }
    }
    
    private func judgeEnemy(){
        let isEnemy = player.frame.intersects(enemyImage.frame) ? true : false
        if(isEnemy && !isEnemyHidden){
            gameOver()
        }
        for weapon in weaponList {
            if(player.frame.intersects(weapon.frame)){
                weapon.isHidden = true
                if(!weapon.getIsHidden()){
                    weaponCount -= 1
                }
                weapon.setHidden()
            }
            if(weaponCount == 0){
                gameClear()
            }
        }
    }
    
    private func judgeHelpItem(){
        let isHeart = player.frame.intersects(helpItemHeart.frame) ? true : false
        let isStar = player.frame.intersects(helpItemStar.frame) ? true : false
        if (isStar){
            isEnemyHidden = true
            enemyImage.isHidden = isEnemyHidden
            let dispatchTime = DispatchTime.now() + 5.0
            DispatchQueue.main.asyncAfter( deadline: dispatchTime ) {
                self.isEnemyHidden = false
                self.enemyImage.isHidden = self.isEnemyHidden
            }
        } else if(isHeart){
            hp = Constans.hp
            hpProgressBar.setProgress(hp, animated: true)
        }
    }
}
