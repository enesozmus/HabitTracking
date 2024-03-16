//
//  ContentViewModel.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

extension ContentView {
    final class ViewModel: ObservableObject {
        
        var _isShowingAddHabitView = false
        @Published
        var _isConfirmingResetData: Bool = false
        @Published
        var _isConfirmingResetDailyData: Bool = false
        
        // MARK: - External Representation
        private let _handler: ExternalRepresentationHandler
        
        init(
            _handler: ExternalRepresentationHandler = ExternalRepresentationHandler()
        ) {
            self._handler = _handler
            loadSavedHabitsOrDefault()
        }
        
        @Published
        private(set) var dailyHabits = [Habit]() {
            didSet {
                _handler.daily.encodeAndSave(dailyHabits)
            }
        }
        
        @Published
        private(set) var weeklyHabits = [Habit]() {
            didSet {
                _handler.weekly.encodeAndSave(weeklyHabits)
            }
        }
        
        @Published
        private(set) var monthlyHabits = [Habit]() {
            didSet {
                _handler.monthly.encodeAndSave(monthlyHabits)
            }
        }
        
        private func loadSavedHabitsOrDefault() {
            dailyHabits = _handler.daily.decodeAndReturnSavedDataOrNil(
                type: [Habit].self
            ) ?? []
            
            weeklyHabits = _handler.weekly.decodeAndReturnSavedDataOrNil(
                type: [Habit].self
            ) ?? []
            
            monthlyHabits = _handler.monthly.decodeAndReturnSavedDataOrNil(
                type: [Habit].self
            ) ?? []
        }
        
        
        // MARK: - CRUD Operations
        func addHabit(
            name: inout String,
            category: Habit.Category,
            startDate: Date,
            completedTimes: Int,
            notes: String
        ) -> Void {
            assignDefaultHabitName(to: &name)
            let moddedCompletedTimes = handleCompletedTimesOrDefault(completedTimes)
            
            let newItem = Habit(
                name: name,
                category: category,
                startDate: startDate,
                completedTimes: moddedCompletedTimes,
                notes: notes
            )
            addHabit(newItem)
        }
        
        private func addHabit(_ newItem: Habit) -> Void {
            switch newItem.category {
            case .daily:
                dailyHabits.append(newItem)
            case .weekly:
                weeklyHabits.append(newItem)
            case .monthly:
                monthlyHabits.append(newItem)
            }
        }
        
        fileprivate func assignDefaultHabitName(to name: inout String) -> Void {
            if name == "" { name = "Untitled Habit" }
        }
        
        fileprivate func handleCompletedTimesOrDefault(_ amount: Int) -> Int {
            return amount < 0 ? 0 : amount
        }
        
        func updateHabits(with item: Habit) -> Void {
            guard let index = getIndex(of: item) else { return }
            
            switch item.category {
            case .daily: dailyHabits[index] = item
            case .weekly: weeklyHabits[index] = item
            case .monthly: monthlyHabits[index] = item
            }
        }
        
        private func getIndex(of item: Habit) -> Int? {
            switch item.category {
            case .daily:
                return dailyHabits.firstIndex { $0.id == item.id }
            case .weekly:
                return weeklyHabits.firstIndex { $0.id == item.id }
            case .monthly:
                return monthlyHabits.firstIndex { $0.id == item.id }
            }
        }
        
        func deleteDailyHabits(at offsets: IndexSet) -> Void {
            dailyHabits.remove(atOffsets: offsets)
        }
        
        func deleteWeeklyHabits(at offsets: IndexSet) -> Void {
            weeklyHabits.remove(atOffsets: offsets)
        }
        
        func deleteMonthlyHabits(at offsets: IndexSet) -> Void {
            monthlyHabits.remove(atOffsets: offsets)
        }
        
        func resetDailyHabits() {
            dailyHabits.removeAll()
        }
        
        // Reset app data
        func resetDefaults() {
            dailyHabits.removeAll()
            weeklyHabits.removeAll()
            monthlyHabits.removeAll()
        }
        
    }
}
