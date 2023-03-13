
import UIKit
import FirebaseAuth
import Firebase

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref = Database.database().reference(withPath: "people")
    var item: [Person] = []
    var personId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetup()
        getData()
        
    }

    @IBAction func LogoutButtonPressed(_ sender: Any) {
        let vc = LogoutVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        let vc = AddNewPersonVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func getData() {
        ref.observe(.value) { snapshot in
            var persons:[Person] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let newPerson = Person(snapshot: snapshot){
                    persons.append(newPerson)
                }
            }
            self.item = persons
            self.tableView.reloadData()
        }
    }
    
}

//MARK:- table Extection
extension HomeVC {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let preson = item[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.nameL.text = preson.name + " " + preson.lname
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    
    func tableSetup () {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "MyCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MyCell")
    
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let personItem = item[indexPath.row]
            personItem.ref?.removeValue()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UpdateDataVC()
        vc.personID = item[indexPath.row].key
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
