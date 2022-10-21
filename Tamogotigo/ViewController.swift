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
    @IBOutlet weak var snowView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        snowScene = SnowScene(size: CGSize(width: snowView.frame.size.width, height: snowView.frame.size.height))
        snowView.presentScene(snowScene)
    }

    func snowRun() {
        // coloque aqui o código do que precisa ser feito quando ele correr
        
        
        
        //ignore o código abaixo
        snowScene?.startRunningAnimation()
        
        // resetando a animação do snow para idle após 3 segundos
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.snowScene?.startIdleAnimation()
        }
    }
    
    func snowBark() {
        // coloque aqui o código do que precisa ser feito quando ele latir
        
        
        
        // ignore o código abaixo
        snowScene?.startBarkAnimation()
        
        // resetando a animação do snow para idle após 3 segundos
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.snowScene?.startIdleAnimation()
        }
    }
    
    func snowDefeated() {
        // coloque aqui o código do que precisa ser feito quando o snow for derrotado
        
        
        // ignore o código abaixo
        snowScene?.startDefeatedAnimation()
    }
    
    func snowSit() {
        // coloque aqui o código do que precisa ser feito quando o snow descansar
        
        
        // ignore o código abaixo
        snowScene?.startSitAnimation()
        
        // resetando a animação do snow para idle após 3 segundos
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.snowScene?.startIdleAnimation()
        }
    }
    
    // só escondendo a status bar
    // testa remover abaixo pra ver como fica sem
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

