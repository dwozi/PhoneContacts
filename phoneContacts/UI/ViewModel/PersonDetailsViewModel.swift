//
//  PersonDetailsViewModel.swift
//  phoneContacts
//
//  Created by Hakan Hardal on 12.03.2024.
//

import Foundation

class PersonDetailsViewModel{
    var personRepo = PersonsRepository()
    
    func update(person_ID: Int ,person_name:String,person_phone:String){
        personRepo.update(person_ID: person_ID, person_name: person_name, person_phone: person_phone)
    }
    
}
