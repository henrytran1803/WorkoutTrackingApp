//
//  test.swift
//  WorkoutTrackingApp
//
//  Created by Tran Viet Anh on 17/03/2024.
//

import SwiftUI
import SwiftData
struct test: View {
    @Environment (\.modelContext) var modelContext
    @Query var muscleGroups: [MuscleGroup]
    var body: some View{
        NavigationView {
            List {
                ForEach(muscleGroups) { muscleGroup in
                    Text("\(muscleGroup.name)")
                }
            }
            .toolbar {
                Button(action: {
                    addSampleMuscleGroups()
                }, label: {
                    Text("Button")
                })
            }
            .navigationTitle("Muscle Groups")
        }


//        NavigationStack (path: $path){
//            MuscleGroupList()
//                .navigationTitle("Muscle Group")
//                .navigationDestination(for: MuscleGroup.self, destination: MuscleGroupDetail.init)
//                .toolbar {
//                    Button(action: {
//                        addSampleMuscleGroups()
//                    }, label: {
//                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//                    })
//
//                    Menu("Sort") {
//                        Picker("Sort", selection: $sortOrder) {
//                            Text("Name")
//                                .tag(SortDescriptor(\MuscleGroup.name))
//
//
//                        }
//                        .pickerStyle(.inline)
//                    }
//                }
//                .searchable(text: $searchText)
//        }
    }

    func addSampleMuscleGroups() {
        let muscleGroup1 = MuscleGroup()
      
        modelContext.insert(muscleGroup1)

    }


//    func deleteSet (_ indexSet: IndexSet){
//        for index in indexSet{
//            let user = MuscleGroup[index]
//            modelContext.delete(user)
//        }
//    }
}

#Preview {
    test()
}
