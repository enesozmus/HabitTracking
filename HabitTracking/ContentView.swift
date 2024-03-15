//
//  ContentView.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject
    var viewModel: ViewModel
    
    init(viewModel: ContentView.ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    @State private var _isShowingAddHabit: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(
                    header: Text("Daily Habits")
                ) {
                    if viewModel.dailyHabits.isEmpty {
                        emptyHabitsText
                    } else {
                        //...
                    }
                }
                
                Section(
                    header: Text("Weekly Habits")
                ) {
                    if viewModel.weeklyHabits.isEmpty {
                        emptyHabitsText
                    } else {
                        // ...
                    }
                }
                
                Section(
                    header: Text("Monthly Habits")
                ) {
                    if viewModel.monthlyHabits.isEmpty {
                        emptyHabitsText
                    } else {
                        // ...
                    }
                }
            }
            .navigationTitle("Better You")
            .toolbar {
                Button {
                    _isShowingAddHabit.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
    }
}

extension ContentView {
    @ViewBuilder
    private var emptyHabitsText: some View {
        
        let emptyHabitListSentence: LocalizedStringKey = "Nothing yet. Tap \(Image(systemName: "plus.circle")) to add more"
        
        HStack {
            Spacer()
            Text(emptyHabitListSentence)
                .font(.system(.callout, design: .rounded))
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
