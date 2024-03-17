//
//  MuscleGroupDetail.swift
//  WorkoutTrackingApp
//
//  Created by Tran Viet Anh on 17/03/2024.
//

import SwiftUI
import SwiftData
struct MuscleGroupDetail: View {
    @Bindable var muscle: MuscleGroup
    @Query var subs: [SubMuscleGroup]
    @State private var selection = Set<SubMuscleGroup>()
    var body: some View {
        Form{
            Section("Name"){
                TextField("",text: $muscle.name)
            }
            Section("Type") {
                List {
                    Picker("Choose", selection: $muscle.type) {
                        ForEach(types.allCases) { planet in
                                Text(planet.rawValue.capitalized)
                        }
                    }
                }
               
            }
            Section("Sub") {
                
            }
        }.navigationTitle("\(muscle.name)")
            
        
    }
}

#Preview {
    do{
        let cofig = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: SubMuscleGroup.self,MuscleGroup.self, configurations: cofig)
        let user = MuscleGroup(name: "anh",type: "push", sub: [])
        return  MuscleGroupDetail(muscle: user)
            .modelContainer(container)
    }
    catch{
        fatalError("fail to create")
    }
    
}
