//
//  PersonsRepository.swift
//  phoneContacts
//
//  Created by Hakan Hardal on 12.03.2024.
//

import Foundation
import RxSwift
import Alamofire

class PersonsRepository{
    
    var personsList = BehaviorSubject<[Persons]>(value: [Persons]())
    
    func personSave(person_name:String, person_phone:String){
        print("\(person_name)-\(person_phone)")
        let parameter : Parameters = ["kisi_ad":person_name,"kisi_tel":person_phone]
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php",method: .post,parameters: parameter).response { response in
            guard let data = response.data else {return}
            do{
                let result =  try JSONDecoder().decode(CRUDResponse.self, from: data)
                
            }catch{
                print(error.localizedDescription)

            }
        }
    }
    
    func update(person_ID: Int ,person_name:String,person_phone:String){
        print("Person Contact: \(person_ID)-\(person_name)-\(person_phone)")
        let parameter : Parameters = ["kisi_id":person_ID,"kisi_ad":person_name,"kisi_tel":person_phone]
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php",method: .post,parameters: parameter).response { response in
            guard let data = response.data else {return}
            do{
                _ = try JSONDecoder().decode(CRUDResponse.self, from: data)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    func delete(person_ID: Int){
        print("Person Delete: \(person_ID)")
        let parameter : Parameters = ["kisi_id":person_ID]
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php",method: .post,parameters: parameter).response { response in
            guard let data = response.data else {return}
            do{
                _ = try JSONDecoder().decode(CRUDResponse.self, from: data)
                self.personUpload()
            }catch{
                print(error.localizedDescription)
            }
        }
            }
    
    func search(searchText: String){
        print("search Contact: \(searchText)")
        let parameter : Parameters = ["kisi_ad":searchText]
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php",method: .post,parameters: parameter).response{ response in
            do{
                if let data = response.data {
                    do {
                        let response = try JSONDecoder().decode(PersonsResponse.self, from: data)
                        if let list = response.kisiler{
                            self.personsList.onNext(list)
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func personUpload(){
        
        //personsList.onNext(list)//Trigger
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php",method: .get).response{response in
            guard let data = response.data else{return}
            do{
                let response = try JSONDecoder().decode(PersonsResponse.self, from: data)
                guard let list = response.kisiler else{return}
                self.personsList.onNext(list)
            }catch{
                print(error.localizedDescription)
            }
            
        }
        
    
        
    }
    
}
