//
//  LoginViewController.swift
//  Retreat
//
//  Created by Bizet Rodriguez on 3/23/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit
import Lottie
import Firebase
import SVProgressHUD

class LoginViewController: LoginView {
    
    // MARK: - IBOutlets
    @IBOutlet var reatreatTitle: UILabel!
    @IBOutlet var topView: UIView!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var animationView: AnimationView!
    
    // MARK: - Private Variables
    let defaults = UserDefaults.standard
    
    
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
        SVProgressHUD.show(withStatus: "Loading...")
        
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            print("No input for text field")
            SVProgressHUD.dismiss()
            return
        }
        
        Auth.auth().signIn(withEmail: username, password: password) { (user, error) in
            SVProgressHUD.dismiss()
            if error != nil {
                SVProgressHUD.showError(withStatus: "Error With Login...")
                SVProgressHUD.dismiss(withDelay: 1)
                print(error!)
            }
            else {
                SVProgressHUD.showSuccess(withStatus: "Sucessfully Logged In!")
                SVProgressHUD.dismiss(withDelay: 1)
                self.defaults.set(username, forKey: "email")
                self.defaults.set(password, forKey: "password")
                self.performSegue(withIdentifier: "goToNewsFeedFromLogin", sender: self)
            }
        }
        
        
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRegisterFromLogin", sender: nil)
    }
}
