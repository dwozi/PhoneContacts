//
//  MainViewModel.swift
//  phoneContacts
//
//  Created by Hakan Hardal on 12.03.2024.
//

import Foundation
import RxSwift

class MainViewModel{
    
    var personRepo = PersonsRepository()
    var personList = BehaviorSubject<[Persons]>(value: [Persons]())
    
    init(){
        personList = personRepo.personsList
        personUpload()
    }
    
    func delete(person_ID: Int){
        personRepo.delete(person_ID: person_ID)
    }
    
    func search(searchText: String){
        personRepo.search(searchText: searchText)
    }
    
    func personUpload(){
        personRepo.personUpload()
    }
    
    
}
