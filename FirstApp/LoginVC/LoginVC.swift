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
                let token = Auth.auth().currentUser?.uid
                UserDefaults.standard.setValue(token, forKey: "token")
                Auth.auth().addStateDidChangeListener { resutl, user in
                    let vc = HomeVC()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            } else {
                let alert = UIAlertController(title: "login Faild", message: error?.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel)
                alert.addAction(action)
                self.present(alert, animated: true)
          }
        }
        
    }
    
    func signup(email: String, pass: String){
        Auth.auth().createUser(withEmail: email, password: pass){ authResult, error in
            if authResult != nil {
                let alert = UIAlertController(title: "Created Account Succssfuly", message:nil , preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel)
                alert.addAction(action)
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Created Account Faild", message:error?.localizedDescription , preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel)
                alert.addAction(action)
                self.present(alert, animated: true)
          }

        }
        
    }
}
