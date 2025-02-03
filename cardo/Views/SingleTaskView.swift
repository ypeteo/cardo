//
//  TaskView.swift
//  cardo
//
//  Created by Peter Yang on 28/1/2025.
//

import SwiftUI

struct SingleTaskView: View {
    let task: Task
    let toggleCompletion: () -> Void
    
    @State private var showDetailView = false
    
    var body: some View {
        HStack {
            HStack {
                Text(task.title)
                    .font(.headline)
                    .strikethrough(task.isCompleted)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                showDetailView = true
            }
            
            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding()
        .sheet(isPresented: $showDetailView) {
            TaskDetailView(task: task)
        }

    }
}

#Preview {
    SingleTaskView(task: Task.sampleData[0]) {
        print("Task toggled")
    }
}
