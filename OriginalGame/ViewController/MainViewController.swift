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
    private var weaponTimer:Timer!
    
    private var X : CGFloat = 5.0
    private var Y : CGFloat = 5.0
    private var dX : CGFloat = 0.0
    private var dY : CGFloat = 0.0
    
    private var weaponCount:Int!
    private var weaponList : [Weapon] = []
    private var XList : [CGFloat] = []
    private var YList : [CGFloat] = []
    private var dXList : [CGFloat] = []
    private var dYList : [CGFloat] = []
    
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
        
        weaponCount = Int(arc4random() % 4) + 1
        for i in 0..<weaponCount {
            let randX = Int(arc4random() % UInt32(screenWidth - 100))
            let randY = Int(arc4random() % UInt32(screenHeight - 200))
            let frame:CGRect = CGRect(x: randX, y: randY, width: 50, height: 50)
            let weapon:Weapon = Weapon(frame: frame)
            XList.append(weapon.center.x)
            YList.append(weapon.center.y)
            dXList.append(0.0)
            dYList.append(0.0)
            weaponList.append(weapon)
            self.view.addSubview(weapon)
        }
        
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.showHelpItem), userInfo: nil, repeats: true)
        timer.fire()
        weaponTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.startAnimate), userInfo: nil, repeats: true)
        weaponTimer.fire()
    }
    
    @objc func startAnimate(){
        for i in 0..<weaponCount{
            dXList[i] += 0.5
            dYList[i] += 0.5
            XList[i] += dXList[i]
            YList[i] += dYList[i]
            weaponList[i].center.x = XList[i]
            weaponList[i].center.y = YList[i]
            if(XList[i] < 0 || self.screenWidth < XList[i]){
                dXList[i] *= -1
            } else if(YList[i] < 0 || self.screenHeight < YList[i]){
                dYList[i] *= -1
            }
        }
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

