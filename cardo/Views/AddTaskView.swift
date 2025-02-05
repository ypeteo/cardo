//
//  SwiftUIView.swift
//  cardo
//
//  Created by Peter Yang on 5/2/2025.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        HStack {
            TextField("Enter new task", text: $viewModel.newTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                viewModel.addTask()
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
            }
        }
        .padding()
    }
}

#Preview {
    let viewModel = TaskViewModel()
    viewModel.tasks = Task.sampleData
    
    return AddTaskView(viewModel: viewModel)
}
