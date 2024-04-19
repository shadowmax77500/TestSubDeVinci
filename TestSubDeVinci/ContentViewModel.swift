//
//  ContentViewModel.swift
//  TestSubDeVinci
//
//  Created by COURS1 on 19/04/2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var pseudo: String = ""
    @Published var firstname: String = ""
    @Published var familyname: String = ""
    @Published var password: String = ""
    @Published var isAdmin: Bool = false
    
    var storageModel = DataController.shared
    
    func saveUser(pseudo: String, firstname: String, familyName: String, password: String, isAdmin: Bool) {
        storageModel.saveUser(pseudo: pseudo, firstname: firstname, familyName: familyName, password: password, isAdmin: isAdmin)
    }
    
    func deleteUser(user: User) {
        storageModel.remove(User: user)
    }
    
    func getAllUser() -> [User] {
        storageModel.getAllUser()
    }
    
    func Conection(pseudo: String, password: String) -> Bool {
        storageModel.Conection(pseudo: pseudo, password: password)
    }
        
}
