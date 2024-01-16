//
//  DetailView.swift
//  ToDoList
//
//  Created by David Veeneman on 12/7/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State var toDo: ToDo
    var newToDo = false
    
    /* Note that we declare an @EnvironmentObject (different from an
     @Environment variable) to receive the ViewModel from the parent 
     view, and we create a toDo property to receive the individual 
     ToDo object selected by the user in the parent View. The property 
     is declared with an @State wrapper, so that the ToDo's properties
     can be bound to the View's components.*/
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Enter To Do here", text: $toDo.item)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                Toggle("Set Reminder:", isOn: $toDo.reminderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                DatePicker("Date", selection: $toDo.dueDate)
                    .disabled(!toDo.reminderIsOn)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                Text ("Notes:")
                    .padding(.top)
                TextField("", text: $toDo.notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                Toggle ("Completed:", isOn: $toDo.isCompleted)
                    .padding(.top)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        /* If new, append to toDoVM.toDos, else update
                        the toDo that was passed in from the List */
                        
                        if newToDo {
                            toDosVM.toDos.append (toDo)
                            dismiss()
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(toDo: ToDo())
                .environmentObject (ToDosViewModel())
        }
    }
}
