//
//  HabitDetailCell.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

struct HabitDetailCell: View {
    let title: String
    let caption: LocalizedStringKey
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(.headline, design: .rounded).bold())
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            Text(caption)
                .font(.system(.caption, design: .rounded))
                .padding(6)
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.15))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.quaternary)
        )
    }
}

#Preview {
    HabitDetailCell(title: "Habit Name", caption: "Name")
}
