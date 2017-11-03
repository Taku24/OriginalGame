//
//  ViewController.swift
//  OriginalGame
//
//  Created by TAKU on 2017/10/09.
//  Copyright © 2017年 taku. All rights reserved.
//
// 変数、Outlet関連

import UIKit
import AVFoundation

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
    
    internal var audio:AVAudioPlayer = AVAudioPlayer()
    internal let se1:String = Bundle.main.path(forResource: "se1", ofType: "mp3")!
    internal let seGameClear:String = Bundle.main.path(forResource: "gameclear", ofType: "wav")!
    internal let seGameOver:String = Bundle.main.path(forResource: "gameover", ofType: "mp3")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        screenWidth = UIScreen.main.bounds.width
        screenHeight = UIScreen.main.bounds.height
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
        hp -= 0.1
        hpProgressBar.setProgress(hp, animated: true)
        if(hp <= 0.0){
            gameOver()
        }
    }
}
