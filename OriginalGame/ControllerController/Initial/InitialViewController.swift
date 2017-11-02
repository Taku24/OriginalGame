//
//  InitialViewController.swift
//  OriginalGame
//
//  Created by TAKU on 2017/11/02.
//  Copyright © 2017年 taku. All rights reserved.
//

import UIKit

class InitialViewController : UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var levelStepper: UIStepper!
    private let userDefaults:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setEnemyCount()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func levelStepperAction(_ sender: UIStepper) {
        setEnemyCount()
    }
    
    private func setEnemyCount(){
        let value:Int = Int(levelStepper.value)
        counterLabel.text = String(value)
        userDefaults.set(value, forKey: Constans.enemyCount)
    }
}
