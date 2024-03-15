//
//  AddHabitViewModel.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

extension AddHabitView {
    final class ViewModel: ObservableObject {
        private let listViewModel: ContentView.ViewModel
        
        init(parentVM: ContentView.ViewModel) {
            self.listViewModel = parentVM
        }
        
        @Published
        var habitName: String = ""
        
        @Published
        var habitCategory: Habit.Category = .daily
        
        @Published
        var startDate: Date = Date()
        
        @Published
        var habitCompletedTimes: Int = 1
        
        @Published
        var habitNotes: String = ""
        
        func addHabit(
            name: inout String,
            category: Habit.Category,
            startDate: Date,
            completedTimes: Int,
            notes: String
        ) -> Void {
            listViewModel.addHabit(
                name: &name,
                category: category,
                startDate: startDate,
                completedTimes: completedTimes,
                notes: notes
            )
        }
    }
}
