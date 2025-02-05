//
//  DatePickerView.swift
//  cardo
//
//  Created by Peter Yang on 5/2/2025.
//

import SwiftUI

struct DateSelectorView: View {
    @Binding var selectedDate: Date?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        DatePicker(
            "Select a date",
            selection: Binding(
                get: { selectedDate ?? Date() },
                set: { selectedDate = $0 }
        ), displayedComponents: [.date])
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()
        
    }
}

#Preview {
    DateSelectorView(selectedDate: .constant(Date()))
}
