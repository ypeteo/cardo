//
//  TasksView.swift
//  cardo
//
//  Created by Peter Yang on 29/1/2025.
//

import SwiftUI

struct TasksView: View {
    let tasks: [Task]
    
    var body: some View {
        List(tasks, id: \.id) { task in
            CardView(task: task)
                .listRowBackground(Color.aquamarine)
        }
    }
}

#Preview {
    TasksView(tasks: Task.sampleData)
}
