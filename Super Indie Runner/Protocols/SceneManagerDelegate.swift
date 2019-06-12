//
//  SceneManagerDelegate.swift
//  Super Indie Runner
//
//  Created by Amer Alyusuf on 6/11/19.
//  Copyright © 2019 Amer Alyusuf. All rights reserved.
//

import Foundation

protocol SceneManagerDelegate {
    
    func presentLevelScene(for world: Int)
    func presentGameScene(for level: Int, in world: Int)
    func presentMenuScene()
    
}
