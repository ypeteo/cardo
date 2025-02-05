//
//  SwiftUIView.swift
//  cardo
//
//  Created by Peter Yang on 5/2/2025.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    @Environment(\.dismiss) private var dismiss
    @State var showDatePickerView = false
    
    var body: some View {
        VStack {
            TextField("Enter new task", text: $viewModel.newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
//                HStack {
//                    if let dueDate = viewModel.newTaskDueDate {
//                        Text(dueDate, style: .date)
//                    }
//
//                    Button(action: {
//                        showDatePickerView = true
//                    }) {
//                        Image(systemName: "calendar.badge.plus")
//                            .font(.title)
//                    }
//                    .sheet(isPresented: $showDatePickerView) {
//                        DatePickerView(selectedDate: $viewModel.newTaskDueDate)
//                            .presentationDetents([.medium])
//                    }
//                }
                AddDueDateView(dueDate: $viewModel.newTaskDueDate)


                Button(action: {
                    viewModel.addTask()
                    dismiss()
                }) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.title)
                }
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
