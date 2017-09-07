//
//  GameScene.swift
//  SpaceOne
//
//  Created by pari on 06/09/17.
//  Copyright © 2017 pari. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let myNode = SKSpriteNode(imageNamed: "shuttle")
    
    override func didMove(to view: SKView) {
        
        myNode.position = CGPoint(x: 0, y: 0)
        //make shuttle smaller
        //0.5 = half of this size
        //its similar to
        //im not setScale bcs its make to smaller for my shuttle
//        myNode.setScale(0.5)
        myNode.setScale(2.5)
//        let action = SKAction.rotate(byAngle: 2, duration: (2))
//        let action = SKAction.move(to: CGPoint(x: 100, y: 200), duration: (2))
        
            //if i do like
        myNode.alpha = 0
        let action = SKAction.fadeIn(withDuration: (3))
//        myNode.run(action)
        myNode.run(SKAction.repeatForever(action))
        self.addChild(myNode);
    }
    
    
    
    //touchesBegan , touchesEnded , touchesMoved - this 3 methods are there
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            let location = touch.location(in: self)
//            let myNode1 = SKSpriteNode(imageNamed: "shuttle")
//            myNode.position = location
//            self.addChild(myNode1)
//        }
//    }
    override func update(_ currentTime: TimeInterval) {
//        myNode.position.y += 1;
    }

}
