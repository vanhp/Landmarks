//
//  FilterView.swift
//  MacLandmarks
//
//  Created by vphom on 10/13/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var userData: UserData
    @Binding var filter: FilterType
    
    var body: some View {
        HStack {
                Picker(selection: $filter, label: EmptyView()) {
                    ForEach(FilterType.allCases){ choice in
                        Text(choice.name).tag(choice)
                    }
                Spacer()
                Toggle(isOn: $userData.showFavoritesOnly){ Text("Favorite Only") }
            }
        }
    }
}

struct FilterType:Hashable,CaseIterable,Identifiable {
    var name: String
    var category: Landmark.Category?
    static var all = FilterType(name: "All")
    static var allCases: [FilterType] {
        return [.all] + Landmark.Category.allCases.map(FilterType.init)
    }
    var id: FilterType {
        return self
    }
    
    init(_ category: Landmark.Category){
        self.name = category.rawValue
        self.category = category
    }
    
    // for no filter case
    init(name: String) {
        self.name = name
        self.category = nil
    }
}





struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        
        FilterView(filter: .constant(.all)).environmentObject(UserData())
    }
}
