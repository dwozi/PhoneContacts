//
//  PersonSaveViewModel.swift
//  phoneContacts
//
//  Created by Hakan Hardal on 12.03.2024.
//

import Foundation

class PersonSaveViewModel{
    var personRepo = PersonsRepository()
    
    
    func personSave(person_name:String, person_phone:String){
        personRepo.personSave(person_name: person_name, person_phone: person_phone)
    }
}
