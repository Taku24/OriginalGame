//
//  TouchScreen.swift
//  OriginalGame
//
//  Created by TAKU on 2017/11/03.
//  Copyright © 2017年 taku. All rights reserved.
//
// タッチ判定

import UIKit

extension MainViewController {
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchEvent = touches.first!
        
        let preDx:CGFloat = touchEvent.previousLocation(in: self.view).x
        let preDy:CGFloat = touchEvent.previousLocation(in: self.view).y
        let newDx:CGFloat = touchEvent.location(in: self.view).x
        let newDy:CGFloat = touchEvent.location(in: self.view).y
        
        let dx:CGFloat = newDx - preDx
        let dy:CGFloat = newDy - preDy
        
        var viewFrame: CGRect = player.frame
        viewFrame.origin.x += dx
        viewFrame.origin.y += dy
        
        player.frame = viewFrame
        move += 0.1
        judgeIntersects()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(enemyCount != 0){
            gameOver()
        }
    }
    
}
