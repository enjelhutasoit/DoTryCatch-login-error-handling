//
//  Alert.swift
//  DoTryCatch
//
//  Created by Enjelina on 08/03/20.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    class func showBasic(title: String, message: String, vc: UIViewController) {
        
        let alert =  UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
        
    }
}
