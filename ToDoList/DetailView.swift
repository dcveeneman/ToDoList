//
//  DetailView.swift
//  ToDoList
//
//  Created by David Veeneman on 12/7/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var toDo = ""
    @State private var reminderIsOn = false
    @State private var dueDate = Date.now + (60*60*24)
    @State private var notes = ""
    @State private var isCompleted = false

    var passedValue: String
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Enter To Do here", text: $toDo)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                Toggle("Set Reminder:", isOn: $reminderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                DatePicker("Date", selection: $dueDate)
                    .disabled(!reminderIsOn)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                Text ("Notes:")
                    .padding(.top)
                TextField("", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                Toggle ("Completed:", isOn: $isCompleted)
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

#Preview {
    DetailView(passedValue: "Item 1")
}
