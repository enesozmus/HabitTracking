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
                // ..
                Section( header: Text("Daily Habits")) {
                    if viewModel.dailyHabits.isEmpty {
                        emptyHabitsText
                    } else {
                        //...
                        ForEach(viewModel.dailyHabits) { item in
                            HomeListCell(viewModel: .init(item: item))
                        }
                    }
                }
                // ..
                Section( header: Text("Weekly Habits")) {
                    if viewModel.weeklyHabits.isEmpty {
                        emptyHabitsText
                    } else {
                        // ...
                        ForEach(viewModel.weeklyHabits) { item in
                            HomeListCell(viewModel: .init(item: item))
                        }
                    }
                }
                // ..
                Section(header: Text("Monthly Habits")) {
                    if viewModel.monthlyHabits.isEmpty {
                        emptyHabitsText
                    } else {
                        // ...
                        ForEach(viewModel.monthlyHabits) { item in
                            HomeListCell(viewModel: .init(item: item))
                        }
                    }
                }
            }
            .navigationTitle("Keep Going")
            .toolbar {
                Button {
                    _isShowingAddHabit.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
            //...
            .sheet(isPresented: $_isShowingAddHabit) {
                AddHabitView(
                    viewModel: .init(parentVM: self.viewModel)
                )
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
