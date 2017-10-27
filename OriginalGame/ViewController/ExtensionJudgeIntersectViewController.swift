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
        if(isEnemy){
            gameOver()
        }
    }
    
    private func judgeHelpItem(){
        let isHeart = player.frame.intersects(helpItemHeart.frame) ? true : false
        let isStar = player.frame.intersects(helpItemStar.frame) ? true : false
        if (isHeart){
            helpItemHeart.isHidden = true
        } else if(isStar){
            helpItemStar.isHidden = true
        }
    }
    
    private func gameOver(){
        player.isHidden = true
        gameoverLabel.isHidden = false
        enemyImage.isHidden = true
        returnBtn.isHidden = false
        returnBtn.isEnabled = true
    }
}
