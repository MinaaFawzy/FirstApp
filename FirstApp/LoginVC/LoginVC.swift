//
//  LoginVC.swift
//  FirstApp
//
//  Created by Mo0oN on 06/03/2023.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    
    @IBAction func okButton(_ sender: Any) {
        if emailTF.text != nil && passTF.text != nil {
            if segment.selectedSegmentIndex == 0 {
                login(email: emailTF.text!, pass: passTF.text!)
            } else {
                signup(email: emailTF.text!, pass: passTF.text!)
            }
        }
    }
    
    func login(email: String, pass: String) {
        Auth.auth().signIn(withEmail: email, password: pass){ authResult, error in
            //guard let strongSelf = self else { return }
            if authResult != nil {
                print("Done")
                UserDefaults.standard.setValue(email, forKey: "email")
                let vc = LogoutVC()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            } else {
                print(error!)
          }
        }
        
    }
    
    func signup(email: String, pass: String){
        Auth.auth().createUser(withEmail: email, password: pass){ authResult, error in
            if authResult != nil {
                print("Done")
            } else {
                print(error?.localizedDescription)
          }

        }
        
    }
}
