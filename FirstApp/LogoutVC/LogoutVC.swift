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
        print(UserDefaults.standard.value(forKey: "token"))
    }

    @IBAction func logoutButton(_ sender: Any) {
        
        
        do {try? Auth.auth().signOut()}
        	
        let vc = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    

}
