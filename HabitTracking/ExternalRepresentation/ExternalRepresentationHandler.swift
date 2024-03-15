//
//  BundleHandler.swift
//  HabitTracking
//
//  Created by enesozmus on 15.03.2024.
//

final class ExternalRepresentationHandler {
  let daily: IExternalRepresentation
  let weekly: IExternalRepresentation
  let monthly: IExternalRepresentation
  
  init(
    dailyPersistence: IExternalRepresentation = ExternalRepresentation(/* for: */ habitCategory: .daily),
    weeklyPersistence: IExternalRepresentation = ExternalRepresentation(/* for: */ habitCategory: .weekly),
    monthlyPersistence: IExternalRepresentation = ExternalRepresentation(/* for: */ habitCategory: .monthly)
  ) {
    self.daily = dailyPersistence
    self.weekly = weeklyPersistence
    self.monthly = monthlyPersistence
  }
}
