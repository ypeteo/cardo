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
    
    @State private var showTaskDetails = false
    
    var body: some View {
        HStack {
            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.accentColor)
            }
            .padding(.trailing)
            .buttonStyle(BorderlessButtonStyle())
            
            HStack {
                Text(task.title)
                    .font(.headline)
                    .strikethrough(task.isCompleted)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                showTaskDetails = true
            }
        }
        .padding()
        .sheet(isPresented: $showTaskDetails) {
            TaskDetailView(task: task)
        }

    }
}

#Preview {
    SingleTaskView(task: Task.sampleData[0]) {
        print("Task toggled")
    }
}
