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

    var passedValue: String
    
    var body: some View {
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
                .padding(.top)
                .listRowSeparator(.hidden)
            TextField("Notes", text: $notes, axis: .vertical)
        }
        .listStyle(.plain)
        .padding()
    }
}

#Preview {
    DetailView(passedValue: "Item 1")
}
