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
    
    @State private var _refresh: Bool = false
    
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
                        // ..
                        ForEach(viewModel.dailyHabits) { item in
                            NavigationLink {
                                HabitDetailView(
                                    viewModel: .init(item: item, parentVM: self.viewModel)
                                )
                            } label: {
                                HomeListCell(viewModel: .init(item: item))
                            }
                        }
                        .onDelete(perform: viewModel.deleteDailyHabits)
                    }
                }
                // if you want you can also use this
                //                Section {
                //                    resetDailyButton
                //                }
                //                .listRowBackground(Color.clear)
                
                // ..
                Section( header: Text("Weekly Habits")) {
                    if viewModel.weeklyHabits.isEmpty {
                        emptyHabitsText
                    } else {
                        // ...
                        ForEach(viewModel.weeklyHabits) { item in
                            NavigationLink {
                                HabitDetailView(
                                    viewModel: .init(item: item, parentVM: self.viewModel)
                                )
                            } label: {
                                HomeListCell(viewModel: .init(item: item))
                            }
                        }
                        .onDelete(perform: viewModel.deleteWeeklyHabits)
                    }
                }
                // ..
                Section(header: Text("Monthly Habits")) {
                    if viewModel.monthlyHabits.isEmpty {
                        emptyHabitsText
                    } else {
                        // ...
                        ForEach(viewModel.monthlyHabits) { item in
                            NavigationLink {
                                HabitDetailView(
                                    viewModel: .init(item: item, parentVM: self.viewModel)
                                )
                            } label: {
                                HomeListCell(viewModel: .init(item: item))
                            }
                        }
                        .onDelete(perform: viewModel.deleteMonthlyHabits)
                    }
                }
                // ..
                Section(
                    footer: Text("Be careful, this removes all your habit trackers! Restart the app to see changes")
                ) {
                    resetAppButton
                }
                
            }
            .navigationTitle("Keep Going")
            // ...
            .confirmationDialog(
                "This action cannot be undone",
                isPresented: $viewModel._isConfirmingResetData,
                titleVisibility: .visible
            ) {
                Button("Delete", role: .destructive) {
                    viewModel.resetDefaults()
                    _refresh.toggle()
                }
                Button("Cancel", role: .cancel) { }
            }
            // ...
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
    
    @ViewBuilder
    private var resetDailyButton: some View {
        Button(role: .destructive) {
            viewModel._isConfirmingResetDailyData.toggle()
        } label: {
            Label("Delete all Daily Habits", systemImage: "trash")
        }
    }
    
    @ViewBuilder
    private var resetAppButton: some View {
        Button(role: .destructive) {
            viewModel._isConfirmingResetData.toggle()
        } label: {
            Label("Reset to Original", systemImage: "trash")
        }
    }
    
}

#Preview {
    ContentView()
}
