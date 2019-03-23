//
//  LoginViewController.swift
//  Retreat
//
//  Created by Bizet Rodriguez on 3/23/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit

class LoginViewController: LoginView {
    
    // MARK: - IBOutlets
    @IBOutlet var reatreatTitle: UILabel!
    @IBOutlet var topView: UIView!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            print("No input for text field")
            
            return
        }
        
        performSegue(withIdentifier: "goToNewsFeedFromLogin", sender: nil)
        
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRegisterFromLogin", sender: nil)
    }
}
