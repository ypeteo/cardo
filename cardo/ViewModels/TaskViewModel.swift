//
//  TaskViewModel.swift
//  cardo
//
//  Created by Peter Yang on 28/1/2025.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    func addTask(title: String) {
        let newTask = Task(title: title, isCompleted: false)
        tasks.append(newTask)
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
