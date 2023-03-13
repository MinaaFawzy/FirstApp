//
//  LogoutVC.swift
//  FirstApp
//
//  Created by Mo0oN on 06/03/2023.
//

import UIKit
import FirebaseAuth

class LogoutVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logoutButton(_ sender: Any) {
        
        do {
            try? Auth.auth().signOut()
            UserDefaults.standard.setValue(nil, forKey: "token")
        }
        	
        let vc = LoginVC()
        self.navigationController?.setViewControllers([vc], animated: true)
        
    }
    

}
