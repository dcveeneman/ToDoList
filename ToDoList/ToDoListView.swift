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
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Image (systemName: "eye")
                    Text ("Show the New View!")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}



#Preview {
    ToDoListView()
}
