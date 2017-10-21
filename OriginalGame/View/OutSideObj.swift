//
//  View.swift
//  OriginalGame
//
//  Created by TAKU on 2017/10/09.
//  Copyright © 2017年 taku. All rights reserved.
//

import UIKit

class OutSideObj: UIImageView {
    
    private var enemyNum:Int = 0
    private var outSideImages:[String] = ["heart.png", "lightning", "star.png"]
    
    override init(image: UIImage?) {
        enemyNum = Int(UInt32(arc4random()) % UInt32(outSideImages.count))
        let overImage = UIImage(named: outSideImages[enemyNum])
        super.init(image: overImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        
    }
    
}
