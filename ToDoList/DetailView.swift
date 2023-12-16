//
//  DetailView.swift
//  ToDoList
//
//  Created by David Veeneman on 12/7/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    var passedValue: String
    
    var body: some View {
        List {
            
        }

        .padding()
    }
}

#Preview {
    DetailView(passedValue: "Item 1")
}
