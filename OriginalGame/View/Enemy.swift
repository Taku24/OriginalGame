//
//  View.swift
//  OriginalGame
//
//  Created by TAKU on 2017/10/09.
//  Copyright © 2017年 taku. All rights reserved.
//

import UIKit

class Enemy : UIImageView {
    
    private var enemyNum:Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "cloud.png")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        
    }
    
}
