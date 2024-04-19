//
//  DataController.swift
//  SubDeVinci-CoreData
//
//  Created by Guillaume on 17/04/2024.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    static var shared = DataController()
        
    let container = NSPersistentContainer(name: "StorageUsers")
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func saveUser(pseudo: String, firstname: String, familyName: String, password: String, isAdmin: Bool) {
        let allUser = getAllUser()
        for user in allUser {
            if user.pseudo == pseudo {
                return
            }
        }
        let registeredUser =  User(context: viewContext)
        registeredUser.id = UUID()
        registeredUser.pseudo = pseudo
        registeredUser.firstname = firstname
        registeredUser.familyName = familyName
        registeredUser.password = password
        registeredUser.isAdmin = isAdmin
        do {
            try viewContext.save()
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
        }
    }
    func remove(User: User) {
        viewContext.delete(User)
        do {
            try viewContext.save()
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
        }
    }
        
    func getAllUser() -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")
        
            do {
                return try viewContext.fetch(request)
            } catch {
                return []
            }
        }
        
    func Conection(pseudo: String, password: String) -> Bool {
        let allUser = getAllUser()
        for user in allUser {
            if user.pseudo == pseudo && user.password == password {
                return true
            }
        }
    return false
    }
    
    func saveGrade(pseudo: String, password: String, grade: Int) {
        let allUser = getAllUser()
        for user in allUser {
            if user.pseudo == pseudo && user.password == password {
                user.grade = Int16(grade)
            }
        }
    }
}

