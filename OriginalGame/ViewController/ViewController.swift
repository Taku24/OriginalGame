//
//  ViewController.swift
//  OriginalGame
//
//  Created by TAKU on 2017/10/09.
//  Copyright © 2017年 taku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var player: UIImageView!
    @IBOutlet weak var topWall: UIView!
    @IBOutlet weak var leftWall: UIView!
    @IBOutlet weak var rightWall: UIView!
    @IBOutlet weak var bottomWall: UIView!
    
    private var screenWidth:CGFloat = 0.0
    private var screenHeight:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func gameInit(){
        screenWidth = UIScreen.main.bounds.width
        screenHeight = UIScreen.main.bounds.height
        
        player.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
    }
    
    private func judgeIntersects(){
        let isTop = player.frame.intersects(topWall.frame) ? true : false
        let isBottom = player.frame.intersects(bottomWall.frame) ? true : false
        let isLeft = player.frame.intersects(leftWall.frame) ? true : false
        let isRight = player.frame.intersects(rightWall.frame) ? true : false
        if(isTop || isBottom || isLeft || isRight){
            player.isHidden = true
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchEvent = touches.first!
        
        let preDx = touchEvent.previousLocation(in: self.view).x
        let preDy = touchEvent.previousLocation(in: self.view).y
        let newDx = touchEvent.location(in: self.view).x
        let newDy = touchEvent.location(in: self.view).y
        
        let dx = newDx - preDx
        let dy = newDy - preDy
        
        var viewFrame: CGRect = player.frame
        viewFrame.origin.x += dx
        viewFrame.origin.y += dy
        
        player.frame = viewFrame
        judgeIntersects()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
