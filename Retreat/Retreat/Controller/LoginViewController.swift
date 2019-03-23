//
//  LoginViewController.swift
//  Retreat
//
//  Created by Bizet Rodriguez on 3/23/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit
import Lottie

class LoginViewController: LoginView {
    
    // MARK: - IBOutlets
    @IBOutlet var reatreatTitle: UILabel!
    @IBOutlet var topView: UIView!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var animationView: AnimationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newAnimationView = AnimationView(name: "heart")
        newAnimationView.contentMode = .scaleAspectFit
        newAnimationView.backgroundColor = .clear
        newAnimationView.loopMode = .loop
//        newAnimationView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        newAnimationView.frame = animationView.bounds
        animationView.addSubview(newAnimationView)
        
        newAnimationView.play()
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
