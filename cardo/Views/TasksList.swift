//
//  TasksView.swift
//  cardo
//
//  Created by Peter Yang on 29/1/2025.
//

import SwiftUI

struct TasksList: View {
    @ObservedObject var viewModel: TaskViewModel
//    @State private var newTask: String = ""
    
    var body: some View {
        List {
            ForEach(viewModel.tasks, id: \.id) { task in
                SingleTaskView(task: task) {
                    viewModel.toggleTask(task)
                }
                .listRowBackground(Color.turquoise)
            }
            .onDelete(perform: viewModel.deleteTask)
        }
        
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
    TasksList(viewModel: {
        let viewModel = TaskViewModel()
        viewModel.tasks = Task.sampleData
        return viewModel
    }())
}
