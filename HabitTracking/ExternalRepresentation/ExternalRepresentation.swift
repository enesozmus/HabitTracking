//
//  Bundle.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

import SwiftUI

final class ExternalRepresentation: IExternalRepresentation {
  
  private static let proxy = UserDefaults.standard
  
  private let habitCategory: Habit.Category
  
  init(habitCategory: Habit.Category) {
    self.habitCategory = habitCategory
  }
  
  private var persistenceKey: String {
    if type(of: Self.proxy) == UserDefaults.self {
      return "\(habitCategory.rawValue).habits"
    }
    
    return "genericKey"
  }
  
  func encodeAndSave<T: Encodable>(_ items: T) -> Void {
    if let encoded = try? JSONEncoder().encode(items) {
      Self.proxy.set(encoded, forKey: persistenceKey)
    }
  }
  
  func decodeAndReturnSavedDataOrNil<T: Decodable>(type: T.Type) -> T? {
    if let data = Self.proxy.object(forKey: persistenceKey) as? Data,
       let object = try? JSONDecoder().decode(T.self, from: data) {
      return object
    }
    
    return nil
  }
}
