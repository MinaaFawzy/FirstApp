//
//  LogoutVC.swift
//  FirstApp
//
//  Created by Mo0oN on 06/03/2023.
//

import UIKit

class LogoutVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func logoutButton(_ sender: Any) {
        UserDefaults.standard.setValue("", forKey: "email")
        print(UserDefaults.standard.value(forKey: "email"))
        let vc = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    

}
