//
//  HomeListCell.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

struct HomeListCell: View {
    @ObservedObject
    var viewModel: Self.ViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.item.name)
                    .font(.system(.headline, design: .rounded))
                
                if viewModel.item.notes != "" {
                    Text(viewModel.item.notes)
                        .font(.system(.caption2, design: .rounded))
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                Text("\(checkIcon) \(viewModel.item.completedTimes)")
                    .font(.system(.body, design: .rounded).bold())
                    .foregroundColor(viewModel.colorForCompletedTimes())
                
                Text("Since \(viewModel.item.numericStartDate)")
                    .font(.system(.caption2, design: .rounded))
                    .foregroundColor(.secondary)
            }
            
        }
    }
}

private extension HomeListCell {
    
    @ViewBuilder
    var checkIcon: Image {
        Image(systemName: "checkmark.circle.fill")
            .symbolRenderingMode(.hierarchical)
    }
}

#Preview {
    HomeListCell(viewModel: HomeListCell.ViewModel(
        item: Habit(
            name: "Work Out 🏋🏻‍♂️",
            category: .daily,
            startDate: Date(),
            completedTimes: 17,
            notes: "At school gymnasium"
        )
    )
    )
}
