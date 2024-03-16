//
//  ViewController.swift
//  phoneContacts
//
//  Created by Hakan Hardal on 11.03.2024.
//

import UIKit
import RxSwift

class MainView: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var personList = [Persons]()
    var viewModel = MainViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        _ = viewModel.personList.subscribe(onNext: { list in
            self.personList = list
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.personUpload()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let person = sender as? Persons{
                let destinationVC = segue.destination as! personDetails
                destinationVC.person = person
            }
            
        }
    }
    
}



extension MainView : UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personsCell") as! personsCell
        cell.labelName.text = personList[indexPath.row].person_name
        cell.labelPhone.text = personList[indexPath.row].person_phone
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toDetail", sender: personList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { UIContextualAction, view, bool in
        
            let person = self.personList[indexPath.row]
            let alert = UIAlertController(title: "Delete Contact", message: "\(person.person_name!)'ll be deleted", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancel)
            let delete = UIAlertAction(title: "Delete", style: .destructive){ action in
                self.viewModel.delete(person_ID: Int(person.person_id!)!)
            }
            alert.addAction(delete)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
    }
}

