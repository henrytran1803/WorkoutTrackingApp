//
//  SubMuscleDetail.swift
//  WorkoutTrackingApp
//
//  Created by Tran Viet Anh on 17/03/2024.
//

import SwiftUI
import SwiftData
struct SubMuscleDetail: View {
    @Bindable var sub: SubMuscleGroup
    var body: some View {
        Form{
            Section("Name"){
                TextField("",text: $sub.name)
            }
            Section("Description"){
                TextField("",text: $sub.descrip)
            }
        }
    }
}

#Preview {
    do{
        let cofig = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: SubMuscleGroup.self, configurations: cofig)
        let user = SubMuscleGroup(name: "anh")
        return  SubMuscleDetail(sub: user)
            .modelContainer(container)
    }
    catch{
        fatalError("fail to create")
    }
}
