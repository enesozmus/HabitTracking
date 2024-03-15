//
//  HabitCategory.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

extension Habit {
    enum Category: String, CaseIterable {
        case daily = "Daily"
        case weekly = "Weekly"
        case monthly = "Monthly"
    }
}

/*
    protocol CaseIterable
        -> A type that provides a collection of all of its values.
        -> Types that conform to the CaseIterable protocol are typically enumerations without associated values.
        -> When using a CaseIterable type, you can access a collection of all of the type’s cases by using the type’s allCases property.
        -> By conforming it to the CaseIterable protocol, we can get access to the .allCases property, which allows us to iterate over each case.
 */
