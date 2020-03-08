//
//  ViewController.swift
//  DoTryCatch
//
//  Created by Enjelina on 08/03/20.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import UIKit

enum loginError: Error {
    case incompleteForm
    case invalidEmail
    case incorrectPasswordLength
}

class ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFiel: UITextField!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtonOutlet.layer.cornerRadius = 5
    }

    // MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: Any) {
        do {
            try login()
            Alert.showBasic(title: "Success Login", message: "Congrats! You succeed login.", vc: self)
            
        } catch loginError.incompleteForm {
            Alert.showBasic(title: "Incomplete Form", message: "Please fill out both email and password fields", vc: self)
        } catch loginError.invalidEmail {
            Alert.showBasic(title: "Invalid Email Format", message: "Please make sure you format your email correctly", vc: self)
        } catch loginError.incorrectPasswordLength {
            Alert.showBasic(title: "Password Too Short", message: "Password should be at least 8 characters", vc: self)
        } catch {
            Alert.showBasic(title: "Unable To Login", message: "There was an error when attempting to login", vc: self)
        }
    }
    
    
    func login() throws {
        let email =  emailTextField.text!
        let password = passwordTextFiel.text!
        
        if email.isEmpty || password.isEmpty {
            throw loginError.incompleteForm
        }
        if !email.isValidEmail {
            throw loginError.invalidEmail
        }
        if password.count < 8 {
            throw loginError.incorrectPasswordLength
        }
    }
}

