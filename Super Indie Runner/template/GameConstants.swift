//
//  GameConstants.swift
//  Super Indie Runner
//
//  Created by Amer Alyusuf on 5/22/19.
//  Copyright © 2019 Amer Alyusuf. All rights reserved.
//

import Foundation
import CoreGraphics

struct GameConstants {
    
    struct ZPoisitions {
        static let farBGZ: CGFloat = 0
        static let closeBGZ: CGFloat = 1
        static let worldZ: CGFloat = 2
        static let objectZ: CGFloat = 3
        static let playerZ: CGFloat = 4
        static let hudZ: CGFloat = 5
    }
    
    struct StringConstants {
        static let groundTilesName = "Ground Tiles"
        static let worldBackgroundNames = ["DessertBackground", "GrassBackground"]
        static let playerName = "Player"
        static let playerImageName = "Idle_0"
    }
    
}

