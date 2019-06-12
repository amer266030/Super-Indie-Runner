//
//  LevelScene.swift
//  Super Indie Runner
//
//  Created by Amer Alyusuf on 6/11/19.
//  Copyright © 2019 Amer Alyusuf. All rights reserved.
//

import SpriteKit

class LevelScene: SKScene {
    
    var world: Int!
    var level: Int!
    
    var popupLayer: SKNode!
    var sceneManagerDelegate: SceneManagerDelegate?
    
    override func didMove(to view: SKView) {
        layoutScene(for: world)
    }
    
    func layoutScene(for world: Int) {
        let backgroundImage = SKSpriteNode(imageNamed: GameConstants.StringConstants.worldBackgroundNames[world])
        backgroundImage.scale(to: frame.size, width: false, multiplier: 1.0)
        backgroundImage.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundImage.zPosition = GameConstants.ZPoisitions.farBGZ
        addChild(backgroundImage)
        
        let titleLabel = SKLabelNode(fontNamed: GameConstants.StringConstants.gameFontName)
        titleLabel.text = "World \(world + 1)"
        titleLabel.fontSize = 200.0
        titleLabel.scale(to: frame.size, width: false, multiplier: 0.1)
        titleLabel.position = CGPoint(x: frame.midX, y: frame.maxY - titleLabel.frame.size.height*1.5)
        titleLabel.zPosition = GameConstants.ZPoisitions.worldZ
        addChild(titleLabel)
        
        let menuButton = SpriteKitButton(defaultButtonImage: GameConstants.StringConstants.menuButton, action: buttonHandler, index: 12)
        menuButton.scale(to: frame.size, width: true, multiplier: 0.2)
        menuButton.position = CGPoint(x: frame.midX, y: frame.minY + menuButton.size.height/1.5)
        menuButton.zPosition = GameConstants.ZPoisitions.worldZ
        addChild(menuButton)
        
        if world != 0 {
            let previousWorldButton = SpriteKitButton(defaultButtonImage: GameConstants.StringConstants.playButton, action: buttonHandler, index: 11)
            previousWorldButton.scale(to: frame.size, width: false, multiplier: 0.075)
            previousWorldButton.xScale *= -1
            previousWorldButton.position = CGPoint(x: frame.minX + previousWorldButton.size.width/1.5, y: frame.maxY - titleLabel.frame.size.height)
            previousWorldButton.zPosition = GameConstants.ZPoisitions.worldZ
            addChild(previousWorldButton)
        }
        
        if world < GameConstants.StringConstants.worldBackgroundNames.count - 1 {
            let nextWorldButton = SpriteKitButton(defaultButtonImage: GameConstants.StringConstants.playButton, action: buttonHandler, index: 10)
            nextWorldButton.scale(to: frame.size, width: false, multiplier: 0.075)
            nextWorldButton.position = CGPoint(x: frame.maxX - nextWorldButton.size.width/1.5, y: frame.maxY - titleLabel.frame.size.height)
            nextWorldButton.zPosition = GameConstants.ZPoisitions.worldZ
            addChild(nextWorldButton)
        }
        
        var level = 1
        let columnStartingPoint = frame.midX/2
        let rowStartingPoint = frame.midY + frame.midX/2
        
        for row in 0..<3 {
            for column in 0..<3 {
                let levelBox = SpriteKitButton(defaultButtonImage: GameConstants.StringConstants.emptyButton, action: buttonHandler, index: level)
                levelBox.position = CGPoint(x: columnStartingPoint + CGFloat(column) * columnStartingPoint, y: rowStartingPoint - CGFloat(row) * columnStartingPoint)
                levelBox.zPosition = GameConstants.ZPoisitions.worldZ
                addChild(levelBox)
                
                let levelLabel = SKLabelNode(fontNamed: GameConstants.StringConstants.gameFontName)
                levelLabel.fontSize = 200.0
                levelLabel.verticalAlignmentMode = .center
                levelLabel.text = "\(level)"
                if !UserDefaults.standard.bool(forKey: "Level_\(world)-\(level)") && level != 1 {
                    levelBox.isUserInteractionEnabled = false
                    levelBox.alpha = 0.75
                }
                levelLabel.scale(to: levelBox.size, width: false, multiplier: 0.5)
                levelLabel.zPosition = GameConstants.ZPoisitions.worldZ
                levelBox.addChild(levelLabel)
                
                levelBox.scale(to: frame.size, width: true, multiplier: 0.2)
                
                level += 1
            }
        }
 
    }
    
    func createAndShowPopup(for level: Int) {
        self.level = level
        popupLayer = SKNode()
        popupLayer.position = CGPoint(x: frame.midX, y: frame.midY)
        
        let shadowLayer = SKSpriteNode(texture: nil, color: UIColor.darkGray, size: frame.size)
        shadowLayer.isUserInteractionEnabled = false
        shadowLayer.zPosition = GameConstants.ZPoisitions.playerZ
        popupLayer.addChild(shadowLayer)
        
        let levelKey = "Level_\(world!)-\(level)"
        let levelPopup = ScorePopupNode(buttonHandlerDelegate: self, title: "\(world)-\(level)", level: levelKey, texture: SKTexture(imageNamed: GameConstants.StringConstants.largePopup), score: ScoreManager.getCurrentScore(for: levelKey)[GameConstants.StringConstants.scoreScoreKey]!, coins: 4, animated: false)
        levelPopup.add(buttons: [3,1])
        levelPopup.scale(to: frame.size, width: true, multiplier: 0.8)
        levelPopup.zPosition = GameConstants.ZPoisitions.hudZ
        popupLayer.addChild(levelPopup)
        
        popupLayer.alpha = 0.0
        addChild(popupLayer)
        popupLayer.run(SKAction.fadeIn(withDuration: 0.2))
    }
    
    func buttonHandler(index: Int) {
        switch index {
        case 1,2,3,4,5,6,7,8,9:
            // level buttons
            break
        case 10:
            // Next World
            sceneManagerDelegate?.presentLevelScene(for: world + 1)
            break
        case 11:
            // Previous World
            sceneManagerDelegate?.presentLevelScene(for: world - 1)
            break
        case 12:
            // Menu
            sceneManagerDelegate?.presentMenuScene()
            break
        default:
            break
        }
    }
    
}

extension LevelScene: PopupButtonHandlerDelegate {
    
    func popupButtonHandler(index: Int) {
        switch index {
        case 3:
            popupLayer.run(SKAction.fadeOut(withDuration: 0.2)) {
                self.popupLayer.removeFromParent()
            }
        case 1:
            //Play
            sceneManagerDelegate?.presentGameScene(for: level, in: world)
        default:
            break
        }
    }
    
}
