//
//  ViewMode.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

extension HabitDetailView {
    
    struct ViewMode: View {
        
        @ObservedObject
        var viewModel: HabitDetailView.ViewModel
        
        let columns = [
            GridItem(.adaptive(minimum: 150, maximum: 180))
        ]
        
        @State
        var isShowingEditHabit: Bool = false
        
        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns) {
                    HabitDetailCell(
                        title: viewModel.item.name,
                        caption: "Name"
                    )
                    
                    if viewModel.item.notes.isEmpty == false {
                        HabitDetailCell(
                            title: viewModel.item.notes,
                            caption: "Notes"
                        )
                    }
                    
                    HabitDetailCell(
                        title: viewModel.item.category.rawValue,
                        caption: "Frequency"
                    )
                    
                    HabitDetailCell(
                        title: viewModel.item.shortStartDate,
                        caption: "Start Date"
                    )
                    
                    HabitDetailCell(
                        title: viewModel.item.completedTimes.formatted(),
                        caption: "Completed Times"
                    )
                }
                .padding([.horizontal, .bottom])
                
                Text("Last updated at \(viewModel.item.formattedLastUpdated)")
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(viewModel.colorForLastUpdated())
            }
            .navigationTitle("Habit Detail")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Edit") {
                    isShowingEditHabit.toggle()
                }
            }
            .sheet(isPresented: $isShowingEditHabit) {
                HabitDetailView.EditMode(viewModel: self.viewModel)
            }
        }
    }
}
