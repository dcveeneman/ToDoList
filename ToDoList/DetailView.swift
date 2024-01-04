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
    var newToDo = false
    
    /* We need to add an @State variable to this view to receive the ToDo
     struct that we're going to be passing in when the parent view creates
     a new instance of this view. The variable has to be an @State variable,
     and it can't be a private @State variable--it has to be exposed to the
     rest of the app, so that the parent view can pass the ToDo instance
     to it. Note that we don't initialize the ToDo's properties in this
     struct, because the parent view will pass in an initialized toDo
     object. */
    
    @State var toDo: ToDo
    
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
                        // TODO: Add Save code here
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
