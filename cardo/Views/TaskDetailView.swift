//
//  TaskDetailView.swift
//  cardo
//
//  Created by Peter Yang on 3/2/2025.
//

import SwiftUI

struct TaskDetailView: View {
    let task: Task
    var body: some View {
        VStack {
            Text(task.title)
                .font(.title)
            
            if let dueDate = task.dueDate {
                Text(dueDate, style: .date)
            }
        }
    }
}

#Preview {
    TaskDetailView(task: Task.sampleData[0])
}
