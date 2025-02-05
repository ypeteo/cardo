//
//  TaskViewModel.swift
//  cardo
//
//  Created by Peter Yang on 28/1/2025.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    var newTaskTitle: String = ""
    @Published var newTaskDueDate: Date? = nil

    func addTask() {
        if !newTaskTitle.isEmpty {
            tasks.append(Task(title: newTaskTitle, isCompleted: false, dueDate: newTaskDueDate))
        }
    }

    func toggleTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
