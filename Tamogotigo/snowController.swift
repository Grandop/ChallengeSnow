//
//  classes.swift
//  Tamogotigo
//
//  Created by Pedro Grando on 21/10/22.
//

import Foundation
import UIKit


class SnowDog {
    var energy: Float = 100.0
    var isAlive: Bool
    
    init(energy: Float = 100.0, isAlive: Bool = true) {
        self.energy = energy
        self.isAlive = isAlive
    }
    
    func addEnergy(newEnergy: Float) {
        self.energy += newEnergy
        if self.energy >= 100.0 {
            self.energy = 100.0
        } 
    }
    
    func decreaseEnergy(newEnergy: Float) {
        energy -= newEnergy
        checkIfDogIsAlive()
    }

    
    func checkIfDogIsAlive() {
        self.isAlive = energy > 0
    }
}
