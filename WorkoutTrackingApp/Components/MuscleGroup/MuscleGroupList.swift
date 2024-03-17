//
//  MuscleGroupList.swift
//  WorkoutTrackingApp
//
//  Created by Tran Viet Anh on 17/03/2024.
//

import SwiftData
import SwiftUI

struct MuscleGroupList: View {
    @Query var muscleGroups: [MuscleGroup]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        List {
            ForEach(muscleGroups) { muscleGroup in
                NavigationLink(value: muscleGroup) {
                    MuscleGroupItem(muscleGroups: muscleGroup)
                }
            }
            .onDelete(perform: deleteUser)
        }
    }

    func deleteUser(_ indexSet: IndexSet) {
        for item in indexSet {
            let object = muscleGroups[item]
            modelContext.delete(object)
        }
    }
}
#Preview {
    MuscleGroupList()
}
