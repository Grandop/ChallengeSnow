//
//  ViewController.swift
//  Tamogotigo
//
//  Created by Julia Eileen Schäfer on 20/10/22.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    var snowScene: SnowScene?
    var snow = SnowDog()

    @IBOutlet weak var energyBar: UIProgressView!
    @IBOutlet weak var snowView: SKView!
    @IBOutlet weak var messageGameOver: UILabel!
        
    @IBOutlet weak var restButtonOutlet: UIButton!
    @IBOutlet weak var barkButtonOutlet: UIButton!
    @IBOutlet weak var runButtonOutlet: UIButton!
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var gameOverView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restartButton.isHidden = true
        gameOverView.isHidden = true
        snowScene = SnowScene(size: CGSize(width: snowView.frame.size.width, height: snowView.frame.size.height))
        snowView.presentScene(snowScene)
        messageGameOver.text = ""
        upateEnergyBar()
    }

    func snowRun() {
        disableAllButtons()
        
        if snow.isAlive {
            snow.decreaseEnergy(newEnergy: 25)
            upateEnergyBar()
            snowScene?.startRunningAnimation()
        }
        
        if !snow.isAlive {
            restButtonOutlet.isEnabled = false
            barkButtonOutlet.isEnabled = false
            runButtonOutlet.isEnabled = false
            snowDefeated()
        }
        
            // resetando a animação do snow para idle após 3 segundos
        resetTimerAnimations()
        

    }
    
    func snowBark() {
        disableAllButtons()
        
        if snow.isAlive {
            snow.decreaseEnergy(newEnergy: 10)
            upateEnergyBar()
            snowScene?.startBarkAnimation()
            
        }
        
        if !snow.isAlive {
            snowDefeated()
        }
        
        
        // resetando a animação do snow para idle após 3 segundos
        resetTimerAnimations()
        
    }
    
    
    func snowDefeated() {
        
        if snow.isAlive == false  {
            snowScene?.startDefeatedAnimation()
            messageGameOver.text = "Game Over!"
            messageGameOver.font = UIFont(name: "Arial-boldMT", size: 40)
            messageGameOver.textColor = UIColor.purple
            
            
        }
        
        
        
    }
    
    func snowSit() {
        disableAllButtons()
        
        if snow.isAlive {
            snow.addEnergy(newEnergy: 25)
            upateEnergyBar()
            snowScene?.startSitAnimation()
        }
        
        if !snow.isAlive {
            snowDefeated()
        }
        
        // resetando a animação do snow para idle após 3 segundos
        resetTimerAnimations()
        
    }
    
    // só escondendo a status bar
    // testa remover abaixo pra ver como fica sem
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func restButton(_ sender: UIButton) {
        snowSit()
    }
    
    @IBAction func barkButton(_ sender: UIButton) {
        snowBark()
    }
    
    @IBAction func runButton(_ sender: UIButton) {
        snowRun()
    }
    
    func upateEnergyBar() {
        energyBar.progress = snow.energy / 100
    }
    
    func disableAllButtons() {
        restButtonOutlet.isEnabled = false
        barkButtonOutlet.isEnabled = false
        runButtonOutlet.isEnabled = false
    }
    
    func enableAllButtons() {
        restButtonOutlet.isEnabled = true
        barkButtonOutlet.isEnabled = true
        runButtonOutlet.isEnabled = true
    }
    
    func resetTimerAnimations() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.resetTimerAnimationsNow()
        }
    }
    
    func resetTimerAnimationsNow() {
        if self.snow.isAlive {
            self.enableAllButtons()
            self.snowScene?.startIdleAnimation()
        } else {
            self.gameOverView.isHidden = false
            self.restartButton.isHidden = false
        }

    }
        
    
    @IBAction func restartButtonAction(_ sender: UIButton) {
        self.gameOverView.isHidden = true
        sender.isHidden = true
        self.snow.energy = 100
        self.snow.isAlive = true
        messageGameOver.text = ""
        resetTimerAnimationsNow()
        upateEnergyBar()
    }
    
    
}

