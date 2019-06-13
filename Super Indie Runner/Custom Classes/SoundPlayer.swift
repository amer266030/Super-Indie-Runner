//
//  SoundPlayer.swift
//  Super Indie Runner
//
//  Created by Amer Alyusuf on 6/13/19.
//  Copyright © 2019 Amer Alyusuf. All rights reserved.
//

import SpriteKit

class SoundPlayer {
    
    let buttonSound = SKAction.playSoundFileNamed("button", waitForCompletion: false)
    let coinSound = SKAction.playSoundFileNamed("coin", waitForCompletion: false)
    let deathSound = SKAction.playSoundFileNamed("gameover", waitForCompletion: false)
    let completedSound = SKAction.playSoundFileNamed("comleted", waitForCompletion: false)
    let powerupSound = SKAction.playSoundFileNamed("powerup", waitForCompletion: false)
    
}
