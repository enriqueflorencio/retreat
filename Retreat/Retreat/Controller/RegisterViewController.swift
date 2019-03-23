//
//  RegisterViewController.swift
//  Retreat
//
//  Created by Bizet Rodriguez on 3/23/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit

class RegisterViewController: RegisterView {
    
    // MARK: -IBOutlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var genderTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        guard let username = usernameTextField.text,
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let gender = genderTextField.text,
            let age = ageTextField.text else {
                print("Error inside one of the text fields")
                
                return
        }
        
        performSegue(withIdentifier: "goToNewsFeedFromRegister", sender: nil)
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLoginFromRegister", sender: nil)
    }
    
}
