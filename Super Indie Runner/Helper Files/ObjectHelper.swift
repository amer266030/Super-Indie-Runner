//
//  ObjectHelper.swift
//  Super Indie Runner
//
//  Created by Amer Alyusuf on 5/23/19.
//  Copyright © 2019 Amer Alyusuf. All rights reserved.
//

import SpriteKit

class ObjectHelper {
    
    static func handdleChild(sprite: SKSpriteNode, with name: String) {
        
        switch name {
        case GameConstants.StringConstants.finishLineName, GameConstants.StringConstants.enemyName:
            PhysicsHelper.addPhysicsBody(to: sprite, with: name)
        default:
            break
        }
        
    }
    
}
