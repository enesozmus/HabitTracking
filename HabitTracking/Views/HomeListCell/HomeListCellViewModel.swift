//
//  HomeListCellViewModel.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

extension HomeListCell {
    final class ViewModel: ObservableObject {
        let item: Habit
        
        init(item: Habit) {
            self.item = item
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
    }
}
