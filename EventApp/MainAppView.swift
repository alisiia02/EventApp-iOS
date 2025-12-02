//
//  MainApp.swift
//  EventApp
//
//  Created by stud on 02/12/2025.
//

import SwiftUI

struct MainAppView: View {
    @State private var selectedTab = 2
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case 0: ChatsView()
            case 1: CreateEventView()
            case 2: MapView()
            case 3: SavedEventsView()
            case 4: ProfileView()
            default: MapView()
            }
            
            BottomNavigaion(selectedTab: $selectedTab)
        }
    }
}
