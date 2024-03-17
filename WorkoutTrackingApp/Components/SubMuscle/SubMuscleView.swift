//
//  SubMuscleView.swift
//  WorkoutTrackingApp
//
//  Created by Tran Viet Anh on 17/03/2024.
//

import SwiftUI
import SwiftData

struct SubMuscleView: View {
    @Environment (\.modelContext) var modelContext
    @Query private var subGroups : [SubMuscleGroup]
    var body: some View {
        NavigationView{
            List {
                ForEach(subGroups) { sub in
                    NavigationLink(destination: SubMuscleDetail(sub: sub)) {
                        Text("\(sub.name)")
                            .foregroundColor(.primary)
                    }
                }
                .onDelete(perform: delete)
            }
            .toolbar{
                Button(action: addSubGroup, label: {
                    Image(systemName: "plus")
                })
            }
        }.navigationBarTitle("Sub")
    }
    
    func addSubGroup(){
        let sub = SubMuscleGroup(name: "Chest")
        modelContext.insert(sub)
    }
    func delete(_ indexSet: IndexSet) {
        for i in indexSet {
            let sub = subGroups[i]
            modelContext.delete(sub)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SubMuscleGroup.self, configurations: config)

    for i in 1..<10 {
        let user = SubMuscleGroup(name: "Example User \(i)")
        container.mainContext.insert(user)
    }

    return SubMuscleView()
        .modelContainer(container)
}
