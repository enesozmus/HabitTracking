//
//  Bundle.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

protocol IExternalRepresentation {
  func encodeAndSave<T: Encodable>(_ items: T) -> Void
  func decodeAndReturnSavedDataOrNil<T: Decodable>(type: T.Type) -> T?
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
