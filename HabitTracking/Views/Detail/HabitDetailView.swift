//
//  HabitDetailView.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

struct HabitDetailView: View {
    
    @ObservedObject
    var viewModel: Self.ViewModel
    
    var body: some View {
        Self.ViewMode(viewModel: viewModel)
    }
}

#Preview {
    HabitDetailView(viewModel: .init(
        item: Habit(
            name: "Work Out 🏋🏻‍♂️",
            category: .daily,
            startDate: Date(),
            completedTimes: 17,
            notes: "At school gymnasium"
        ),
        parentVM: .init()
    ))
}
