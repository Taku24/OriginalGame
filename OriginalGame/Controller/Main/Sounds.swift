//
//  Sounds.swift
//  OriginalGame
//
//  Created by TAKU on 2017/11/03.
//  Copyright © 2017年 taku. All rights reserved.
//
// ゲームのサウンド関連

import UIKit
import AVFoundation

extension MainViewController {
    
    internal func setSounds(flag:Int){
        var url:URL!
        switch flag {
        case Constans.se1:
            url = URL(fileURLWithPath: se1)
            break
            
        case Constans.gameClear:
            url = URL(fileURLWithPath: seGameClear)
            break
            
        case Constans.gameOver:
            url = URL(fileURLWithPath: seGameOver)
            break
            
        default:
            break
        }
        do {
            audio = try AVAudioPlayer(contentsOf: url)
            audio.volume = 1.0
            audio.prepareToPlay()
        } catch {
            
        }
    }
    
    internal func playSounds(){
        audio.play()
    }
    
}
