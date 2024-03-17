//
//  SubMuscleGroup.swift
//  WorkoutTrackingApp
//
//  Created by Tran Viet Anh on 17/03/2024.
//

import Foundation
import SwiftData

@Model
class SubMuscleGroup: Identifiable,Hashable {
    var id : UUID
    var name: String
    var descrip: String
    init(id: UUID = UUID(), name: String, descrip: String = "") {
        self.id = id
        self.name = name
        self.descrip = descrip
    }
    
}
