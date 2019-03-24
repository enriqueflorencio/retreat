//
//  NewsFeedViewController.swift
//  Retreat
//
//  Created by Bizet Rodriguez on 3/24/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit
import NaturalLanguage
import SVProgressHUD
import Firebase

class NewsFeedViewController: NewsFeedView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emotionLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var analyzeButton: UIButton!
    
    // MARK: - Private variables
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func analyzeButtonPressed(_ sender: UIButton) {
        guard let message = messageTextField.text else {
            SVProgressHUD.showError(withStatus: "Error with message")
            return
        }
        
        let sentimentPredictor = try! NLModel(mlModel: emotions().model)
        let emotion = sentimentPredictor.predictedLabel(for: message)
        
        emotionLabel.text = emotion!
        
        changeBackgroundColor(emotion!)
    }
    
    func changeBackgroundColor(_ emotion: String) {
        UIView.animate(withDuration: 1.0) {
            if emotion == "love" {
                self.view.backgroundColor = UIColor.flatPink()
            }
            else if emotion == "anger" {
                self.view.backgroundColor = UIColor.flatRed()
            }
            else if emotion == "surprised" {
                self.view.backgroundColor = UIColor.flatYellow()
            }
            else if emotion == "sad" {
                self.view.backgroundColor = UIColor.flatNavyBlue()
            }
            else if emotion == "fear" {
                self.view.backgroundColor = UIColor.flatBlueColorDark()
            }
            else if emotion == "joy" {
                self.view.backgroundColor = UIColor.flatSkyBlue()
            }
            else {
                self.view.backgroundColor = UIColor.flatPurple()
            }
        }
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        SVProgressHUD.show(withStatus: "Logging out..")
        signOut()
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            defaults.set("", forKey: "email")
            defaults.set("", forKey: "password")
            SVProgressHUD.showSuccess(withStatus: "Logged out successfully")
            performSegue(withIdentifier: "backToLoginPage", sender: nil)
            
        } catch {
            print("Error logging out, \(error)")
            SVProgressHUD.showError(withStatus: "Error Logging Out")
        }
        
        
    }
    
}
