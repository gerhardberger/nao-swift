//
//  Nao.swift
//
//  Created by Hegyi Gellert on 12/6/15.
//  Copyright © 2015 Hegyi Gellert. All rights reserved.
//

import Alamofire

class Nao {
    var PORT = 9559
    var IP = "127.0.0.1"
    var PROTOCOL = "http"
    
    init () { }
    
    init (ipAdress ip: String, port p: Int) {
        IP = ip
        PORT = p
    }
    
    
    // Contructs the url for Nao
    var naoURL: String {
        get { return "\(PROTOCOL)://\(IP):\(PORT)" }
    }
    
    
    // This method sends the command to Nao
    private func eval (cmd: String, callback: ((Bool, String?) -> ())?) {
        let o = [ "eval": cmd ]
        
        Alamofire.request(.GET, naoURL, parameters: o)
            .responseString { res in
                if let cb = callback {
                    cb(res.result.isSuccess, res.result.value)
                }
        }
    }
    
    
    
    // POSTURE API
    private var _maxTry = 3
    
    enum Posture: String {
        case Stand      = "Stand"
        case StandInit  = "StandInit"
        case StandZero  = "StandZero"
        case Crouch     = "Crouch"
        case Sit        = "Sit"
        case SitRelax   = "SitRelax"
        case LyingBelly = "LyingBelly"
        case LyingBack  = "LyingBack"
    }
    
    // Goes to a predefined posture, an "intelligent" command
    func goTo (posture p: Posture, speed s: Float, completion cb: (Bool, String?) -> ()) {
        // Only accepting speed between 0 and 1
        if s < 0 || s > 1 {
            cb(false, nil)
            return
        }
        
        eval("ALRobotPosture.goToPosture(\"\(p.rawValue)\", \(s))", callback: cb)
    }
    
    
    // Applies a predefined posture, used for animation, not "intelligent"
    func apply (posture p: Posture, speed s: Float, completion cb: (Bool, String?) -> ()) {
        // Only accepting speed between 0 and 1
        if s < 0 || s > 1 {
            cb(false, nil)
            return
        }
        
        eval("ALRobotPosture.applyPosture(\"\(p.rawValue)\", \(s))", callback: cb)
    }
    
    
    // Stops the current posture interpolation
    func stop (completion cb: (Bool, String?) -> ()) {
        eval("ALRobotPosture.stopMove()", callback: cb)
    }
    
    
    // Sets the maximum number of tries performed by goTo() before returning a fail
    // Default: 3
    var maxTry: Int {
        get { return _maxTry }
        set {
            _maxTry = newValue
            eval("ALRobotPosture.setMaxTryNumber(\(newValue))", callback: nil)
        }
    }
    
    
    
    // NAVIGATION API
    private var _securityDistance: Float = 0.4
    
    // Makes Nao move to the given pose in the ground plane, relative to FRAME_ROBOT
    func moveTo (x: Float, y: Float, theta: Float, completion cb: (Bool, String?) -> ()) {
        if theta < -3.1415 || theta > 3.1415 {
            cb(false, nil)
            return
        }
        
        eval("ALNavigationProxy.moveTo(\(x), \(y), \(theta))", callback: cb)
    }
    
    
    // Defines the security area in which any object detection stops the robot.
    // Default: 0.4m
    var securityDistance: Float {
        get { return _securityDistance }
        set {
            _securityDistance = newValue
            eval("ALNavigationProxy.setSecurityDistance(\(newValue))", callback: nil)
        }
    }
    
    
    
    // TEXTTOSPEECH API
    private var _language = "English"
    
    
    // Says the specified string of characters.
    func say (s: String, completion cb: (Bool, String?) -> ()) {
        eval("ALTextToSpeech.say(\"\(s)\")", callback: cb)
    }
    
    
    // Sets the language currently used by the text to speech system.
    // Default: English
    var language: String {
        get { return _language }
        set {
            _language = newValue
            eval("ALTextToSpeech.setLanguage(\(newValue))", callback: nil)
        }
    }
}