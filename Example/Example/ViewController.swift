//
//  ViewController.swift
//  Example
//
//  Created by Hegyi Gergely on 12/6/15.
//  Copyright © 2015 Hegyi Gellert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nao = Nao(ipAdress: "localhost", port: 3000) //192.168.1.167
        
        nao.goTo(posture: .Stand, speed: 0.5) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
        
        nao.apply(posture: .Sit, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
        
        nao.stop() { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
        
        nao.maxTry = 5
        
        nao.moveTo(0.1, y: 0.2, theta: 0.1) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
        
        nao.securityDistance = 0.6
        
        nao.say("Hi, I am Nao!") { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }

}

