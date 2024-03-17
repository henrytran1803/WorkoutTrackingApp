//
//  WorkoutTrackingAppApp.swift
//  WorkoutTrackingApp
//
//  Created by Tran Viet Anh on 17/03/2024.
//

import SwiftUI
import SwiftData

@main
struct WorkoutTrackingAppApp: App {
    
    
      let modelContainer: ModelContainer
      
      init() {
          do {
              modelContainer = try ModelContainer(for: SubMuscleGroup.self, MuscleGroup.self)
          } catch {
              fatalError("Could not initialize ModelContainer")
          }
      }
        
    var body: some Scene {
        WindowGroup {
            Setting()
                .modelContainer(modelContainer)
        }
    }
}
