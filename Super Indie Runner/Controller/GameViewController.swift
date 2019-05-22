//
//  GameViewController.swift
//  Super Indie Runner
//
//  Created by Amer Alyusuf on 5/15/19.
//  Copyright © 2019 Amer Alyusuf. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        if #available(iOS 11.0, *), let view = self.view {
//            view.frame = self.view.safeAreaLayoutGuide.layoutFrame
//        }
//    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = GameScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill
            
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
        }
    }

}
