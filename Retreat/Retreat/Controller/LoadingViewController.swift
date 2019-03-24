//
//  LoadingViewController.swift
//  Retreat
//
//  Created by Bizet Rodriguez on 3/24/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit
import Lottie
import ChameleonFramework
import Firebase


class LoadingViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkForLogin()
        
        self.view.backgroundColor = UIColor.flatPurpleColorDark()

        let newAnimationView = AnimationView(name: "alien")
        newAnimationView.contentMode = .scaleAspectFit
        newAnimationView.backgroundColor = .clear
        newAnimationView.loopMode = .loop
        newAnimationView.frame = self.view.bounds
        self.view.addSubview(newAnimationView)
        newAnimationView.play()
        
        performSegue(withIdentifier: "goToLogIn", sender: nil)
        
    }
    

    func checkForLogin() {
        guard
            let email = defaults.string(forKey: "email"),
            let password = defaults.string(forKey: "password") else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                self.performSegue(withIdentifier: "goToLogIn", sender: nil)
            }
            else {
                self.performSegue(withIdentifier: "alreadyLoggedIn", sender: self)
            }
        }
    }
    

}
