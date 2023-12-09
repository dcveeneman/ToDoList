//
//  ToDoListView.swift
//  ToDoList
//
//  Created by David Veeneman on 12/7/23.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        DetailView()
                    } label: {
                        Text("Winter")
                    }
                    Text("Summer")
                } header: {
                    Text("Breaks")
                }
                
                Section {
                    Text("Spring")
                    Text("Fall")
                } header: {
                    Text("Semesters")
                }
            }
            .navigationTitle("School Year")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
        .padding()
    }
}



#Preview {
    ToDoListView()
}
