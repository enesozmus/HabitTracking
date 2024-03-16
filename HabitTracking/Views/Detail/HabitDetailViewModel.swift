//
//  HabitDetailViewModel.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

extension HabitDetailView {
    final class ViewModel: ObservableObject {
        @Published
        var item: Habit
        
        let parentVM: ContentView.ViewModel
        
        init(item: Habit, parentVM: ContentView.ViewModel) {
            self.item = item
            self.parentVM = parentVM
        }
        
        func colorForCompletedTimes() -> Color {
            switch item.completedTimes {
            case 0..<5: return Color.mint
            case 5..<10: return Color.orange
            case 10..<20: return Color.red
            case 20..<Int.max: return Color.green
            default: return Color.primary
            }
        }
        
        func colorForLastUpdated() -> Color {
            return Color.secondary
        }
        
        func updateHabitItemInItsSource() -> Void {
            parentVM.updateHabits(with: item)
        }
    }
}
