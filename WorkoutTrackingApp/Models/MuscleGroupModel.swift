//
//  MuscleGroupModel.swift
//  WorkoutTrackingApp
//
//  Created by Tran Viet Anh on 17/03/2024.
//

import Foundation
import SwiftData

enum types: String, CaseIterable, Identifiable {
    case push = "Push", pull = "Pull", leg = "Leg"
    var id: Self { self }
}

@Model
class MuscleGroup : Identifiable {
    var id: UUID
    var name: String
    var type: String
    var sub: [SubMuscleGroup]?
    init(id: UUID = UUID(), name: String, type: String = "", sub:[SubMuscleGroup] ) {
        self.id = id
        self.name = name
        self.type = type
        self.sub = sub
    }
}

