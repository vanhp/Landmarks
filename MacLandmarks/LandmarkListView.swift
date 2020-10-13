//
//  LandmarkListView.swift
//  MacLandmarks
//
//  Created by vphom on 10/13/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkListView: View {
    @EnvironmentObject var userData: UserData
    @Binding var selectedLandmark: Landmark?
    
    var body: some View {
        List {
            ForEach(userData.landmarks) { landmark in
             
                if !userData.showFavoritesOnly || landmark.isFavorite {
                    LandmarkRow(landmark: landmark).tag(landmark)
                }
                
            }
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView(selectedLandmark: .constant(landmarkData[0]))
            .environmentObject(UserData())
    }
}
