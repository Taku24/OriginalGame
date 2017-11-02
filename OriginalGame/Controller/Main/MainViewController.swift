//
//  ViewController.swift
//  OriginalGame
//
//  Created by TAKU on 2017/10/09.
//  Copyright © 2017年 taku. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var player: UIImageView!
    @IBOutlet weak var topWall: UIView!
    @IBOutlet weak var leftWall: UIView!
    @IBOutlet weak var rightWall: UIView!
    @IBOutlet weak var bottomWall: UIView!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var helpItemHeart: HelpItem!
    @IBOutlet weak var helpItemStar: HelpItem!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var hpProgressBar: UIProgressView!
    
    internal var hp:Float = Constans.hp
    
    internal var screenWidth:CGFloat = 0.0
    internal var screenHeight:CGFloat = 0.0
    internal var timer:Timer!
    
    internal var move:Float = 0
    internal var isEnemyHidden:Bool = false
    
    internal let userDefaults:UserDefaults = UserDefaults.standard
    internal var enemyCount:Int = 0
    
    internal var gameTimer:Timer!
    internal var timeCount:Int = 0
    internal var weaponCount:Int = 10
    internal var weaponList : [Weapon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func returnAction(_ sender: UIButton) {
        gameReset()
        gameInit()
    }
    
    @objc func timerAction(){
        let itemNum : Int = Int(arc4random() % 3)
        switch itemNum {
        case 0:
            helpItemHeart.isHidden = true
            helpItemStar.isHidden = true
            break
        
        case 1:
            helpItemHeart.isHidden = true
            helpItemStar.isHidden = false
            break
            
        case 2:
            helpItemHeart.isHidden = false
            helpItemStar.isHidden = true
            break
            
        default:
            break
        }
        hp -= 2.0
        hpProgressBar.setProgress(hp, animated: true)
        if(hp == 0.0){
            gameOver()
        }
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
        move += 0.1
        judgeIntersects()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(enemyCount != 0){
            gameOver()
        }
    }

}

