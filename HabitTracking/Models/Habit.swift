//
//  Habit.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

struct Habit: Codable, Identifiable {
    /*
         -> A type that can convert itself into and out of an external representation.
         -> When you use Codable as a type or a generic constraint, it matches any type that conforms to both protocols(Encodable and Decodable).
         
         -> Encodable → A type that can encode itself to an external representation.
         -> Decodable → A type that can decode itself from an external representation.
     */
    
    /*
         -> The Identifiable protocol is used to provide a stable notion of identity to a class or value type.
         
         Identities can have any of the following characteristics:
             1. ✅ Guaranteed always unique, like UUIDs.
             2. Persistently unique per environment, like database record keys.
             3. Unique for the lifetime of a process, like global incrementing integers.
             4. Unique for the lifetime of an object, like object identifiers.
             5. Unique within the current collection, like collection indices.
     */
    
    // Type 'Habit' does not conform to protocol 'Identifiable'
    // A universally unique value to identify types, interfaces, and other items.
    // init() -> Creates a UUID with RFC 4122 version 4 random bytes.
    var id: UUID = UUID()
    
    /*
         -> Property observers observe and respond to changes in a property’s value.
         -> Property observers provide useful means to respond to changes in properties.
         -> They are called every time the property’s value is set—Even when the new value is the same as the old value.
         -> There are two types of property observers, willSetand didSet.
             -> willSet is called right before the new value is set.
             -> didSet is called right after the new value is set.
     */
    
    let category: Self.Category
    var lastUpdated: Date = Date()
    
    var startDate: Date {
        didSet {
            lastUpdated = Date()
        }
    }
    /*
        func formatted() -> String
            -> formatted() → Generates a locale-aware string representation of a date using the default date format style.
            -> formatted(date:time:) → Generates a locale-aware string representation of a date using specified date and time format styles.
       
                date →  The date format style to apply to the date.
                    ... .complete, .omitted, .long, .numeric, .abbreviated

     
                time →  The time format style to apply to the date.
                    ... .complete, .omitted, .shortened, .standard
       
        For example, to create a string with a full date and no time representation, set
                the Date.FormatStyle.DateStyle to "complete"
                and the Date.FormatStyle.TimeStyle to "omitted".
     */
    var numericStartDate: String {
        startDate.formatted(date: .numeric, time: .omitted)
    }
    
    var shortStartDate: String {
        startDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    var formattedLastUpdated: String {
        lastUpdated.formatted(date: .numeric, time: .shortened)
    }
    
    var completedTimes: Int {
        didSet {
            lastUpdated = Date()
        }
    }
    
    var notes: String {
        didSet {
            lastUpdated = Date()
        }
    }
}
