//
//  personDetails.swift
//  phoneContacts
//
//  Created by Hakan Hardal on 11.03.2024.
//

import UIKit

class personDetails: UIViewController {

    
    @IBOutlet weak var nameDetail: UITextField!
    
    @IBOutlet weak var phoneDetail: UITextField!
    
    
    var person : Persons?
    var viewModel = PersonDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = person{
            nameDetail.text = k.person_name
            phoneDetail.text = k.person_phone
        }

    }
    @IBAction func updateTap(_ sender: Any) {
        guard let name = nameDetail.text, let number = phoneDetail.text , let person = person else {
            return
        }
        viewModel.update(person_ID: Int(person.person_id!)!, person_name: name, person_phone: number)
    }
    
    
    
    
    
    
}
