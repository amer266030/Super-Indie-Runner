//
//  AnimationHelper.swift
//  Super Indie Runner
//
//  Created by Amer Alyusuf on 5/23/19.
//  Copyright © 2019 Amer Alyusuf. All rights reserved.
//

import SpriteKit

class AnimationHelper {
    
    static func loadTextures(from atlas: SKTextureAtlas, withName name: String) -> [SKTexture] {
        var textures = [SKTexture]()
        
        for index in 0..<atlas.textureNames.count {
            let textureName = name + String(index)
            textures.append(atlas.textureNamed(textureName))
        }
        return textures
    }
    
}
