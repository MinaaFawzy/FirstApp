//
//  AddNewPersonVC.swift
//  FirstApp
//
//  Created by Mo0oN on 13/03/2023.
//

import UIKit
import Firebase

class AddNewPersonVC: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!

    let ref = Database.database().reference(withPath: "people")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func AddNewPersonButtonPressed(_ sender: Any) {
        if firstNameTF.text?.isEmpty == false && lastNameTF.text?.isEmpty == false && ageTF.text?.isEmpty == false{
            let addPerson = Person(name: firstNameTF.text!, lname: lastNameTF.text!, age: ageTF.text!)
            let addPersonRef = self.ref.childByAutoId()
            addPersonRef.setValue(addPerson.toAnyObject())
            dismiss(animated: true)
        }
        
    }
    
    
}
