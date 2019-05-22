//
//  SKNode+Extensions.swift
//  Super Indie Runner
//
//  Created by Amer Alyusuf on 5/15/19.
//  Copyright © 2019 Amer Alyusuf. All rights reserved.
//

import SpriteKit

extension SKNode {
    
    class func unarchiveFromFile(file: String) -> SKNode? {
        if let path = Bundle.main.path(forResource: file, ofType: "sks") {
            let url = URL(fileURLWithPath: path)
            do {
                let sceneData = try Data(contentsOf: url, options: .mappedIfSafe)
//                let archiver = try NSKeyedUnarchiver.init(forReadingFrom: sceneData)
                let archiver = NSKeyedUnarchiver(forReadingWith: sceneData)
                archiver.setClass(self.classForKeyedArchiver(), forClassName: "SKScene")
                let scene = archiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey) as! SKNode
                archiver.finishDecoding()
                return scene
            } catch {
                print(error.localizedDescription)
                return nil
            }
        } else {
            return nil
        }
    }
    
    func scale(to screenSize: CGSize, width: Bool, multiplier: CGFloat) {
        let scale = width ? (screenSize.width * multiplier) / self.frame.size.width : (screenSize.height * multiplier) / self.frame.size.height
        self.setScale(scale)
    }
    
    func trunGravity(on value: Bool) {
        physicsBody?.affectedByGravity = value
    }
    
    func createUserData(entry: Any, forKey key: String) {
        if userData == nil {
            let userDataDictionary = NSMutableDictionary()
            userData = userDataDictionary
        }
        
        userData!.setValue(entry, forKey: key)
    }
    
}
