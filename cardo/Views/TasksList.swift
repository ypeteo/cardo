//
//  TasksView.swift
//  cardo
//
//  Created by Peter Yang on 29/1/2025.
//

import SwiftUI

struct TasksList: View {
    @ObservedObject var viewModel: TaskViewModel
    @State private var showAddTaskModal = false
    
    var body: some View {
        ZStack {
            Text("Tasks")
                .font(.title)
            
            HStack {
                Spacer()
                Button(action: {
                    showAddTaskModal = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(Color.accentColor)
                }
            }
            .padding()
        }
        .sheet(isPresented: $showAddTaskModal) {
            AddTaskView(viewModel: viewModel)
                .presentationDragIndicator(.visible)
                .presentationDetents([.large])
        }
        

        List {
            ForEach(viewModel.tasks, id: \.id) { task in
                SingleTaskView(task: task) {
                    viewModel.toggleTask(task)
                }
            }
            .onDelete(perform: viewModel.deleteTask)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    TasksList(viewModel: {
        let viewModel = TaskViewModel()
        viewModel.tasks = Task.sampleData
        return viewModel
    }())
}
