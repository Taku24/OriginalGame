//
//  View.swift
//  OriginalGame
//
//  Created by TAKU on 2017/10/09.
//  Copyright © 2017年 taku. All rights reserved.
//

import UIKit

class Weapon : UIImageView {
    
    //0は隠れていない、1は隠れている
    var viewHidden: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "lightning.png")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHidden(){
        viewHidden = true
    }
    
    func getIsHidden() -> Bool{
        return viewHidden
    }
    
}
