//
//  ContentView.swift
//  MacLandmarks
//
//  Created by vphom on 10/12/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedLandmark: Landmark?
    
    
    var body: some View {
        NavigationView {
            
           NavigationPrimaryView(selectedLandmark: $selectedLandmark)
            if selectedLandmark != nil {
                NavigationDetailView(landmark: selectedLandmark!)
            }
        }
        .frame(minWidth: 700, minHeight: 300)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
