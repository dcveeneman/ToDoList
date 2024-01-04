//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by David Veeneman on 1/3/24.
//

import Foundation

class ToDosViewModel: ObservableObject {
    var toDos: [ToDo] = []
    
    init() {
        // Temp Data here. Will eventually load in saved data
        toDos.append (ToDo(item: "Learn Swift"))
        toDos.append(ToDo(item: "Build Apps"))
        toDos.append (ToDo(item: "Change the World" ))
    }
}
