//
//  Setting.swift
//  WorkoutTrackingApp
//
//  Created by Tran Viet Anh on 17/03/2024.
//

import SwiftUI

struct Setting: View {
    @State private var isShowingmuscle = false
    @State private var isShowingsub = false
    var body: some View {
        VStack{
            Button(action: {isShowingmuscle = true}, label: {
                Text("isShowingmuscle")
            })
            Button(action: {isShowingsub = true}, label: {
                Text("isShowingsub")
            })
        }.sheet(isPresented: $isShowingmuscle){
            MuscleGroupView()
        }
        .sheet(isPresented: $isShowingsub){
            SubMuscleView()
        }
    }
}

#Preview {
    Setting()
}
