//
//  NewsFeedView.swift
//  Retreat
//
//  Created by Bizet Rodriguez on 3/24/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit

class NewsFeedView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.flatPinkColorDark()
        
        keyboardDismiss()
    }
    
    func keyboardDismiss() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
