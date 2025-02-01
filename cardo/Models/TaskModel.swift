//
//  TaskModel.swift
//  cardo
//
//  Created by Peter Yang on 28/1/2025.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}

extension Task {
    static let sampleData: [Task] =
    [
        Task(title: "hello",
             isCompleted: false
            ),
        Task(title: "hi",
             isCompleted: true
            ),
    ]
}
