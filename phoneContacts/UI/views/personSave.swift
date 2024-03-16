//
//  personSave.swift
//  phoneContacts
//
//  Created by Hakan Hardal on 11.03.2024.
//

import UIKit

class personSave: UIViewController {

    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var phoneText: UITextField!
    
    
    var viewModel = PersonSaveViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveTap(_ sender: Any) {
        
        if let name = nameText.text, let phone = phoneText.text{
            viewModel.personSave(person_name: name, person_phone: phone)
        }
    }


}
