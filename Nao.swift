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
    private func send (params: [String: String], callback: ((Bool, String?) -> ())?) {
        Alamofire.request(.GET, naoURL, parameters: params)
            .responseString { res in
                if let cb = callback {
                    cb(res.result.isSuccess && res.result.value != "error", res.result.value)
                }
        }
    }
    
    
    
    // POSTURE API
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
        
        send([ "goTo": p.rawValue, "speed": s.description ], callback: cb)
    }
    
    
    // Applies a predefined posture, used for animation, not "intelligent"
    func apply (posture p: Posture, speed s: Float, completion cb: (Bool, String?) -> ()) {
        // Only accepting speed between 0 and 1
        if s < 0 || s > 1 {
            cb(false, nil)
            return
        }
        
        send([ "apply": p.rawValue, "speed": s.description ], callback: cb)
    }
    
    
    // Stops the current posture interpolation
    func stop (completion cb: (Bool, String?) -> ()) {
        send([ "stop": "true" ], callback: cb)
    }
    
    
    // NAVIGATION API
  
    // Makes Nao move to the given pose in the ground plane, relative to FRAME_ROBOT
    func moveTo (x x: Float, y: Float, theta: Float, completion cb: (Bool, String?) -> ()) {
        if theta < -3.1415 || theta > 3.1415 {
            cb(false, nil)
            return
        }
        
        send([ "moveTo": "true", "x": x.description, "y": y.description, "t": theta.description ], callback: cb)
    }
    
    
    // TEXTTOSPEECH API
    
    // Says the specified string of characters.
    func say (s: String, completion cb: (Bool, String?) -> ()) {
        send([ "say": s ], callback: cb)
    }
}