//
//  ContentView.swift
//  swiftUI MVVM
//
//  Created by md ali reza on 21/6/23.
//

import SwiftUI

struct PersonView: View {
    
    @ObservedObject var viewModel = PersonViewModel()
    @State private var isMenuVisible = false
    
    var body: some View {
        
        HStack {
            
            Text("SwiftUI MVVM")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Menu {
                Button("Shuffle", action: { viewModel.shuffleOrder()})
                Button("Reverse", action: {viewModel.reverseOrder()})
                Button("Remove First", action: {viewModel.removeFirstPerson()})
                Button("Remove Last", action: {viewModel.removeLastPerson()})
                Button("Remove All", action: {viewModel.removeAll()})
                Button("Refresh", action: {viewModel.addPerson() })
                
                
                // Add more menu options as needed
            } label: {
                Image(systemName: "ellipsis.circle")
                    .font(.title)
                    .padding()
                    .foregroundColor(.primary)
            }
            .menuStyle(BorderlessButtonMenuStyle())
            .padding(.top, 16)
            .padding(.trailing, 16)
            .frame(maxWidth: .infinity, alignment: .topTrailing)
            .onTapGesture {
                isMenuVisible = true
            }
        }
        
        ZStack {
            
            ScrollView {
                ForEach(viewModel.people) {
                    
                    person in HStack {
                        Text(person.name)
                            .font(.system(size:24))
                            .fontWeight(.bold)
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text(person.phoneNumber)
                            
                            Text(person.email)
                                .font(.system(size: 14))
                        }
                    }
                    .frame(height:80)
                    .padding(10)
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
