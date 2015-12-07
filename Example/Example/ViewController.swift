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
        
        let nao = Nao(ipAdress: "127.0.0.1", port: 3001) //192.168.1.167
        
        /*nao.goTo(posture: .Stand, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }*/
        
        /*nao.apply(posture: .StandZero, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }*/
        
        /*nao.stop() { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }*/
        
        /*nao.moveTo(x: 0.1, y: 0.2, theta: 0.1) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }*/

        nao.say("Hi, I am Nao!") { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }

}

