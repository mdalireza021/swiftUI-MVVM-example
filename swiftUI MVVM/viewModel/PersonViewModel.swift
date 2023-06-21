//
//  PersonViewModel.swift
//  swiftUI MVVM
//
//  Created by md ali reza on 21/6/23.
//

import SwiftUI

class PersonViewModel: ObservableObject {
    @Published var people: [Person] = []
    
    init() {
        addPerson()
    }
    
    func addPerson() {
        people = personData
    }
    
    func shuffleOrder() {
        people.shuffle()
    }
    
    func reverseOrder() {
        people.reverse()
    }
    
    func removeFirstPerson() {
        people.removeFirst()
    }
    
    func removeLastPerson() {
        people.removeLast()
    }
    
    func removeAll() {
        people.removeAll();
    }

}


