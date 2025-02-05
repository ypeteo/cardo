//
//  DueDateComponentView.swift
//  cardo
//
//  Created by Peter Yang on 5/2/2025.
//

import SwiftUI

struct AddDueDateView: View {
    @Binding var dueDate: Date?
    @State private var showDatePickerView = false
    
    var body: some View {
        Button(action: {
            showDatePickerView = true
        }) {
            HStack {
                if let date = dueDate {
                    Text(date, style: .date)
                } else {
                    Text("Date")
                }
                Image(systemName: "calendar.badge.plus")
            }
            .foregroundColor(Color.accentColor)
            .bold()
        }
        .sheet(isPresented: $showDatePickerView) {
            DateSelectorView(selectedDate: $dueDate)
                .presentationDetents([.medium])
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.accentColor, lineWidth: 2)
        )
    }
}

#Preview {
    AddDueDateView(dueDate: .constant(Date()))
}
