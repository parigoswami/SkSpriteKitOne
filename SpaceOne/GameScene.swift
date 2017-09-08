//
//  GameScene.swift
//  SpaceOne
//
//  Created by pari on 06/09/17.
//  Copyright © 2017 pari. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    
    let starField = SKEmitterNode(fileNamed: "MyParticle.sks")
    let player = SKSpriteNode(imageNamed: "shuttle")
    var possibleAliens = ["alien","alien2","alien3"]
    let alienCategory:UInt32 = 0x1 << 1
    let photonTorpedoCategory:UInt32 = 0x1 << 0
    
    override func didMove(to view: SKView) {
        addstarFieldFun()
        addPlayer()
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
//        addAlien()
        alienAction()
    }
    func addstarFieldFun(){
        starField?.position = CGPoint(x: 0, y: 1472)
        starField?.advanceSimulationTime(10)
        starField?.zPosition = -1
        self.addChild(starField!)
    }
    func addPlayer(){
        player.position = CGPoint(x: 0, y:  -self.frame.size.height/2 + 50 )
        player.setScale(2)
        self.addChild(player)
    }
    
    func addAlien(){
        possibleAliens = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleAliens) as! [String]
        let alien = SKSpriteNode(imageNamed:possibleAliens[2])
        alien.setScale(1.8)
        let randomAlienPosition = GKRandomDistribution(lowestValue: 4, highestValue: 414)
        let position = CGFloat(randomAlienPosition.nextInt())
        alien.position = CGPoint(x: position, y: self.frame.size.height/2 )
        alien.physicsBody = SKPhysicsBody(rectangleOf: alien.size)
        alien.physicsBody?.isDynamic = true
        
        alien.physicsBody?.categoryBitMask = alienCategory
        alien.physicsBody?.contactTestBitMask = photonTorpedoCategory
        alien.physicsBody?.collisionBitMask = 0
        self.addChild(alien)
        
        let animationDuration : TimeInterval = 2
        var actionArray = [SKAction]()
        actionArray.append(SKAction.move(to: CGPoint(x: position, y: -alien.size.height), duration: animationDuration))
        actionArray.append(SKAction.removeFromParent())
        alien.run(SKAction.sequence(actionArray))
    }
    
    func alienAction(){
//        let alien = SKSpriteNode(imageNamed: "alien3")
//        let GKRandomX =  GKRandomDistribution(lowestValue: -Int(self.frame.size.width/2), highestValue: Int(self.frame.size.width/2))
//        let randomX = CGFloat(GKRandomX.nextInt())
//        alien.position = CGPoint(x: randomX, y: self.frame.size.height/2 )
//        self.addChild(alien)
//
//        let myAction = SKAction.move(to: CGPoint(x: randomX, y: -self.frame.size.height/2 - 20 ), duration: (2))
//        alien.run(myAction)
        let alien = SKSpriteNode(imageNamed: "alien3")
        let GKRandomX =  GKRandomDistribution(lowestValue: -Int(self.frame.size.width/2), highestValue: Int(self.frame.size.width/2))
        let randomX = CGFloat(GKRandomX.nextInt())
        alien.position = CGPoint(x: randomX, y: self.frame.size.height/2 )
        self.addChild(alien)
        
        let myAction = SKAction.move(to: CGPoint(x: randomX, y: -self.frame.size.height/2 - 20 ), duration: (2))
        alien.run(myAction)
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            player.position.x = location.x
            
        }
    }

}
