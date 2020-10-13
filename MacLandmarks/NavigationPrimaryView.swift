//
//  NavigationPrimaryView.swift
//  MacLandmarks
//
//  Created by vphom on 10/13/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct NavigationPrimaryView: View {
    @Binding var selectedLandmark: Landmark?
    
    // the source of truth for filtering
    @State private var filter: FilterType = .all
   
    
    var body: some View {
        VStack {
            FilterView(filter: $filter)
                .controlSize(.small)
                .padding([.top,.leading],8)
                .padding(.trailing,4)
            LandmarkListView(selectedLandmark: $selectedLandmark, filter: $filter)
                .listStyle(SidebarListStyle())
        }
        .frame(minWidth:225,maxWidth: 300)
    }
}

struct NavigationPrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPrimaryView(selectedLandmark: .constant(landmarkData[3]))
            .environmentObject(UserData())
    }
}
