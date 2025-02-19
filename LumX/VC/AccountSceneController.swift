//
//  AccountSceneController.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import UIKit

class AccountSceneController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Account"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
