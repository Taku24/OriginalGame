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
    @IBOutlet weak var gameoverLabel: UILabel!
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var helpItemHeart: HelpItem!
    @IBOutlet weak var helpItemStar: HelpItem!
    @IBOutlet weak var enemyImage: UIImageView!
    
    private var screenWidth:CGFloat = 0.0
    private var screenHeight:CGFloat = 0.0
    private var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func returnAction(_ sender: Any) {
        gameInit()
    }
    
    private func gameInit(){
        screenWidth = UIScreen.main.bounds.width
        screenHeight = UIScreen.main.bounds.height
        player.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        player.isHidden = false
        enemyImage.isHidden = false
        gameoverLabel.isHidden = true
        returnBtn.isHidden = true
        returnBtn.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.showHelpItem), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func showHelpItem(){
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

}

