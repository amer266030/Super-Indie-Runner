//
//  RepeatingLayer.swift
//  Super Indie Runner
//
//  Created by Amer Alyusuf on 5/22/19.
//  Copyright © 2019 Amer Alyusuf. All rights reserved.
//

import SpriteKit

class RepeatingLayer: Layer {
    
    override func updateNodes(_ delta: TimeInterval, childNode: SKNode) {
        if let node = childNode as? SKSpriteNode {
            if node.position.x <= -(node.size.width) {
                if node.name == "0" && self.childNode(withName: "1") != nil || node.name == "1" && self.childNode(withName: "0") != nil {
                    node.position = CGPoint(x: node.position.x + node.frame.width*2, y: node.position.y)
                }
            }
        }
    }
    
}
