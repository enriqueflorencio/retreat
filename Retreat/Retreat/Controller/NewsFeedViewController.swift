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

class NewsFeedViewController: NewsFeedView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emotionLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var analyzeButton: UIButton!
    

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
            else {
                self.view.backgroundColor = UIColor.flatPurple()
            }
        }
    }
    
}
