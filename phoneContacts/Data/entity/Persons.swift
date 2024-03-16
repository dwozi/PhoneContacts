//
//  Persons.swift
//  phoneContacts
//
//  Created by Hakan Hardal on 11.03.2024.
//

import Foundation

class Persons : Codable{
    
    var person_id : String?
    var person_name: String?
    var person_phone: String?
   
    
    private enum CodingKeys : String, CodingKey{
        case person_id = "kisi_id"
        case person_name = "kisi_ad"
        case person_phone = "kisi_tel"
        
    }
    
    
    init(){
        
    }
    
    init(person_id: String, person_name: String, person_phone: String) {
        self.person_id = person_id
        self.person_name = person_name
        self.person_phone = person_phone
    }
    
    
}
