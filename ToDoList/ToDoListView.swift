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
                let seasons: [String] = ["Winter", "Spring", "Summer", "Fall"]
                ForEach(seasons, id:  \.self) { season in
                    NavigationLink {
                        DetailView()
                    } label: {
                        Text(season)
                    }
                }
            }
        }
    }
        .padding()
}


#Preview {
    ToDoListView()
}
