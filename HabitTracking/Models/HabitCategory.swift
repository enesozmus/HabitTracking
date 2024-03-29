//
//  HabitCategory.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

extension Habit {
    enum Category: String, Codable, CaseIterable {
        case daily = "Daily"
        case weekly = "Weekly"
        case monthly = "Monthly"
    }
}

/*
    protocol Codable
         -> A type that can convert itself into and out of an external representation.
         -> When you use Codable as a type or a generic constraint, it matches any type that conforms to both protocols(Encodable and Decodable).
         
         -> Encodable → A type that can encode itself to an external representation.
         -> Decodable → A type that can decode itself from an external representation.
 */

/*
    protocol Codable
        -> Many programming tasks involve sending data over a network connection, saving data to disk, or submitting data to APIs and services.
        -> These tasks often require data to be encoded and decoded to and from an intermediate format while the data is being transferred.
        -> The Swift standard library defines a standardized approach to data encoding and decoding.
        -> You adopt this approach by implementing the Encodable and Decodable protocols on your custom types.
        -> Adopting these protocols lets implementations of the Encoder and Decoder protocols take your data and encode or decode it to and from an external representation such as JSON or property list.
        -> To support both encoding and decoding, declare conformance to Codable, which combines the Encodable and Decodable protocols.
        -> This process is known as making your types codable.
*/

/*
    protocol CaseIterable
        -> A type that provides a collection of all of its values.
        -> Types that conform to the CaseIterable protocol are typically enumerations without associated values.
        -> When using a CaseIterable type, you can access a collection of all of the type’s cases by using the type’s allCases property.
        -> By conforming it to the CaseIterable protocol, we can get access to the .allCases property, which allows us to iterate over each case.
 */
