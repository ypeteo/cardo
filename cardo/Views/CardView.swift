//
//  TaskView.swift
//  cardo
//
//  Created by Peter Yang on 28/1/2025.
//

import SwiftUI

struct CardView: View {
    let task: Task
    
    var body: some View {
        HStack {
            VStack {
                Text(task.title)
                    .font(.headline)
                
            }
            Spacer()
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
        }
        .padding()
    }
}

#Preview {
    let task = Task.sampleData[0]
    CardView(task: task)
}
