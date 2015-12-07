//
//  ViewController.swift
//  Example
//
//  Created by Hegyi Gergely on 12/6/15.
//  Copyright © 2015 Hegyi Gellert. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var nao: Nao!

    @IBOutlet weak var sayText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sayText.delegate = self
        
        nao = Nao(ipAdress: "192.168.1.167", port: 3001) //127.0.0.1
        
        /*nao.apply(posture: .StandZero, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }*/
    }

    @IBAction func sitPressed(sender: AnyObject) {
        nao.goTo(posture: .Sit, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func standPressed(sender: AnyObject) {
        nao.goTo(posture: .Stand, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func sayPressed(sender: AnyObject) {
        nao.stop() { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func standInitPressed(sender: AnyObject) {
        nao.goTo(posture: .StandInit, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func standZeroPressed(sender: AnyObject) {
        nao.goTo(posture: .StandZero, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func crouchPressed(sender: AnyObject) {
        nao.goTo(posture: .Crouch, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func sitRelaxPressed(sender: AnyObject) {
        nao.goTo(posture: .SitRelax, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func lyingBellyPressed(sender: AnyObject) {
        nao.goTo(posture: .LyingBelly, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func lyingBackPressed(sender: AnyObject) {
        nao.goTo(posture: .LyingBack, speed: 1.0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func leftPressed(sender: AnyObject) {
        nao.moveTo(x: 0, y: 0.1, theta: 0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func upPressed(sender: AnyObject) {
        nao.moveTo(x: 0.1, y: 0, theta: 0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func downPressed(sender: AnyObject) {
        nao.moveTo(x: -0.1, y: 0, theta: 0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    @IBAction func rightPressed(sender: AnyObject) {
        nao.moveTo(x: 0, y: -0.1, theta: 0) { success, res in
            if success {
                print(res!)
            }
            else { print("Something went wrong! 😓") }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let t = sayText.text {
            nao.say(t) { success, res in
                if success {
                    print(res!)
                }
                else { print("Something went wrong! 😓") }
            }
            
            view.endEditing(true)
        }
        
        return true
    }
}

