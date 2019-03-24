//
//  ChatUINavigationController.swift
//  Retreat
//
//  Created by Bizet Rodriguez on 3/23/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit

class ChatUINavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        performSegue(withIdentifier: "goToChatRoom", sender: nil)
    }

}
