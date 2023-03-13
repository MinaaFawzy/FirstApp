
import UIKit
import Firebase

class UpdateDataVC: UIViewController {

    var personID: String = ""
    let ref = Database.database().reference(withPath: "people")
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(personID)
        ref.child(personID).observeSingleEvent(of: .value) { snapshot in
            let person = snapshot.value as! [String :Any]
            let name = person["name"] as! String
            let lname = person["lname"] as! String
            let age  = person["age"] as! String
            self.firstNameTF.text = name
            self.lastNameTF.text = lname
            self.ageTF.text = age
        }

    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.navigationBar.isHidden = true
        }
    @IBAction func updateButtonPressed(_ sender: Any) {
        if firstNameTF.text?.isEmpty == false && lastNameTF.text?.isEmpty == false && ageTF.text?.isEmpty == false {
            let updatePerson = Person(name: firstNameTF.text!, lname: lastNameTF.text!, age: ageTF.text!)
            ref.child(personID).updateChildValues(updatePerson.toAnyObject() as! [AnyHashable:Any])
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
