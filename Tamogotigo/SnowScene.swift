//
//  GameScene.swift
//  Tagotigo
//
//  Created by Julia Eileen Schäfer on 20/10/22.
//

import SpriteKit
import GameplayKit

class SnowScene: SKScene {
    var snow: SKSpriteNode!
    var snowDimensions = (width: 171.18, height: 171.18)
    
    private var snowAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "Snow")
    }
    
    private var snowTexture: SKTexture {
        return snowAtlas.textureNamed("skeleton")
    }
    
    private var snowIdleTextures: [SKTexture] {
        var textures: [SKTexture] = []
        for i in 0...30 {
            textures.append(snowAtlas.textureNamed("skeleton-idle_\(i)"))
        }
        return textures
    }
    
    private var snowRunningTextures: [SKTexture] {
        var textures: [SKTexture] = []
        for i in 0...20 {
            textures.append(snowAtlas.textureNamed("skeleton-running_\(i)"))
        }
        return textures
    }
    
    private var snowBarkTextures: [SKTexture] {
        var textures: [SKTexture] = []
        for i in 0...20 {
            textures.append(snowAtlas.textureNamed("skeleton-bark_\(i)"))
        }
        return textures
    }
    
    private var snowDefeatedTextures: [SKTexture] {
        var textures: [SKTexture] = []
        for i in 0...34 {
            textures.append(snowAtlas.textureNamed("skeleton-defeated_\(i)"))
        }
        return textures
    }
    
    private var snowSitTextures: [SKTexture] {
        var textures: [SKTexture] = []
        for i in 0...20 {
            textures.append(snowAtlas.textureNamed("skeleton-sit_\(i)"))
        }
        return textures
    }
    
    private func setupSnow() {
        snow = SKSpriteNode(texture: snowTexture, size: CGSize(width: snowDimensions.width, height: snowDimensions.height))
        snow.position = CGPoint(x: frame.width/2, y: snowDimensions.height/2)
        
        addChild(snow)
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .clear
        self.view?.allowsTransparency = true
        self.setupSnow()
        self.startIdleAnimation()
    }
    
    func startIdleAnimation() {
        let idleAnimation = SKAction.animate(with: snowIdleTextures, timePerFrame: 0.03)
        
        snow.run(SKAction.repeatForever(idleAnimation), withKey: "snowIdleAnimation")
    }
    
    func startRunningAnimation() {
        let runningAnimation = SKAction.animate(with: snowRunningTextures, timePerFrame: 0.03)
        
        snow.run(SKAction.repeatForever(runningAnimation), withKey: "snowRunningAnimation")
    }
    
    func startBarkAnimation() {
        let barkAnimation = SKAction.animate(with: snowBarkTextures, timePerFrame: 0.03)
        
        snow.run(SKAction.repeatForever(barkAnimation), withKey: "snowBarkAnimation")
    }
    
    func startDefeatedAnimation() {
        let defeatedAnimation = SKAction.animate(with: snowDefeatedTextures, timePerFrame: 0.05)
        
        snow.run(defeatedAnimation)
    }
    
    func startSitAnimation() {
        let sitAnimation = SKAction.animate(with: snowSitTextures, timePerFrame: 0.03)
        
        snow.run(SKAction.repeatForever(sitAnimation), withKey: "snowSitAnimation")
    }
}
