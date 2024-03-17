//
//  MuscleGroupView.swift
//  WorkoutTrackingApp
//
//  Created by Tran Viet Anh on 17/03/2024.
//

import SwiftUI
import SwiftData
struct MuscleGroupView: View {
    @Environment (\.modelContext) var modelContext
    @Query private var muscleGroups : [MuscleGroup]
    var body: some View {
        NavigationView{
            List{
                ForEach(muscleGroups){ muscle in
                    NavigationLink(destination: MuscleGroupDetail(muscle: muscle)) {
                        Text("\(muscle.name)")
                            .foregroundColor(.primary)
                    }
                }.onDelete(perform: delete)
            }.toolbar{
                Button(action: addMuscle, label: {
                    Image(systemName: "plus")
                })
            }
            
            
        }
    }
    func addMuscle(){
        let new = MuscleGroup(name: "IDK", sub: [])
        modelContext.insert(new)
    }
    func delete(_ indexSet: IndexSet) {
        for i in indexSet {
            let student = muscleGroups[i]
            modelContext.delete(student)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: MuscleGroup.self, configurations: config)
    for i in 1..<10 {
        let user = SubMuscleGroup(name: "Example User \(i)")
        container.mainContext.insert(user)
    }
    for i in 1..<10 {
        let user = MuscleGroup(name: "Example User \(i)", sub: [])
        container.mainContext.insert(user)
    }

    return MuscleGroupView()
        .modelContainer(container)
}
