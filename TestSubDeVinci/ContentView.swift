//
//  ContentView.swift
//  TestSubDeVinci
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    @State var isConnected = false
    
    var body: some View {
        if isConnected {
            Text("Conecter")
        } else {
            VStack {
                
                Text("Connexion")
                
                Form {
                    TextField("Pseudo", text: $viewModel.pseudo) {
                        
                    }
                    TextField("Password", text: $viewModel.password)
                    
                    Button("Connexion") {
                        if viewModel.Conection(pseudo: viewModel.pseudo, password: viewModel.password) {
                            isConnected = true
                        }
                    }
                }
                
                Text("Insciption")
                
                Form {
                    TextField("Pseudo", text: $viewModel.pseudo) {
                        
                    }
                    
                    TextField("Firstname", text: $viewModel.firstname) {
                        
                    }
                    
                    TextField("Familyname", text: $viewModel.familyname) {
                        
                    }
                    
                    TextField("Password", text: $viewModel.password)
                    
                    Button("Connexion") {
                        viewModel.saveUser(pseudo: viewModel.pseudo, firstname: viewModel.firstname, familyName: viewModel.familyname, password: viewModel.password, isAdmin: viewModel.isAdmin)
                    }
                }
            }
            .padding()
            
        }
        
    }
}

#Preview {
    ContentView()
}
