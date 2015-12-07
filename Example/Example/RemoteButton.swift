//
//  RemoteButton.swift
//  Example
//
//  Created by Hegyi Gergely on 12/7/15.
//  Copyright © 2015 Hegyi Gellert. All rights reserved.
//

import UIKit

class RemoteButton: UIButton {

    override var highlighted: Bool {
        get {
            return super.highlighted
        }
        set {
            if newValue {
                backgroundColor = UIColor(red: 96 / 255.0, green: 165 / 255.0, blue: 155 / 255.0, alpha: 1)
                titleLabel!.textColor = UIColor.whiteColor()
            }
            else {
                backgroundColor = UIColor(red: 184 / 255.0, green: 157 / 255.0, blue: 129 / 255.0, alpha: 1)
                titleLabel!.textColor = UIColor.whiteColor()
            }
            super.highlighted = newValue
        }
    }

}
