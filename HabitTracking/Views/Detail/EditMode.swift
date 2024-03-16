//
//  EditMode.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

extension HabitDetailView {
    struct EditMode: View {
        @Environment(\.dismiss) var dismissThisView
        
        @ObservedObject
        var viewModel: HabitDetailView.ViewModel
        
        var body: some View {
            NavigationView {
                Form {
                    Section(
                        header: Text("General")
                    ) {
                        TextField(
                            "Name",
                            text: $viewModel.item.name
                        )
                        
                        DatePicker(
                            "Date Started",
                            selection: $viewModel.item.startDate,
                            in: ...Date(),
                            displayedComponents: .date
                        )
                        
                        HStack {
                            Text("Completed Times:")
                            Stepper(
                                "\(viewModel.item.completedTimes)",
                                value: $viewModel.item.completedTimes,
                                in: 0...100
                            )
                        }
                    }
                    
                    Section(
                        header: Text("Notes")
                    ) {
                        TextField(
                            "Notes",
                            text: $viewModel.item.notes,
                            prompt: Text("Add extra notes")
                        )
                    }
                }
                
                .navigationTitle("Edit Habit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismissThisView()
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            didTapDoneButton()
                        }
                        .font(.headline)
                    }
                }
            }
        }
        
        private func didTapDoneButton() -> Void {
            viewModel.updateHabitItemInItsSource()
            dismissThisView()
        }
    }
}
