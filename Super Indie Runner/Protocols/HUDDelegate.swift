//
//  HUDDelegate.swift
//  Super Indie Runner
//
//  Created by Amer Alyusuf on 6/9/19.
//  Copyright © 2019 Amer Alyusuf. All rights reserved.
//

import Foundation

protocol HUDDelegate {
    
    func updateCoinLabel(coins: Int)
    func addSuperCoin(index: Int)
    
}
