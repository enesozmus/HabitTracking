//
//  AddHabitView.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismissThisView
    
    @ObservedObject
    var viewModel: Self.ViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(
                    header: Text("General")
                ) {
                    TextField(
                        "Name",
                        text: $viewModel.habitName
                    )
                    
                    Picker(
                        "Type",
                        selection: $viewModel.habitCategory
                    ) {
                        ForEach( Habit.Category.allCases, id: \.self) { category in
                            Text(category.rawValue)
                        }
                    }
                    
                    DatePicker(
                        "Date Started",
                        selection: $viewModel.startDate,
                        in: ...Date(),
                        displayedComponents: .date
                    )
                    
                    HStack {
                        Text("Completed Times:")
                        Stepper(
                            "\(viewModel.habitCompletedTimes)",
                            value: $viewModel.habitCompletedTimes,
                            in: 0...100
                        )
                    }
                }
                
                Section(
                    header: Text("Notes")
                ) {
                    TextField(
                        "Notes",
                        text: $viewModel.habitNotes,
                        prompt: Text("Add extra notes...")
                    )
                }
            }
            .navigationTitle("Add Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismissThisView()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        addNewHabitThenDismissView()
                    }
                    .font(.headline)
                }
            }
        }
    }
}

extension AddHabitView {
    private func addNewHabitThenDismissView() -> Void {
        
        viewModel.addHabit(
            name: &viewModel.habitName,
            category: viewModel.habitCategory,
            startDate: viewModel.startDate,
            completedTimes: viewModel.habitCompletedTimes,
            notes: viewModel.habitNotes
        )
        dismissThisView()
    }
}

#Preview {
    AddHabitView(viewModel: .init(parentVM: ContentView.ViewModel()))
}
