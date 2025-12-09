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
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case 0: ChatsView()
                case 1: CreateEventView()
                case 2: MapView()
                case 3: SavedEventsView()
                case 4: Profile()
                default: MapView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(edges: .all)
            
            BottomNavigation(selectedTab: $selectedTab)

        }
        .ignoresSafeArea(.keyboard)
    }
}

struct BottomNavigation: View {
    @Binding var selectedTab: Int

    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 22)
                .fill(Color(.systemBackground))
                .frame(height: 70)
              
            HStack {
                navButton(index: 0, icon: "ic_home")
                navButton(index: 1, icon: "dashboard 1")
                Spacer().frame(width: 50)
                navButton(index: 3, icon: "ic_wishlist")
                navButton(index: 4, icon: "placeholder")
            }
            .padding(.horizontal, 50)
            .padding(.bottom, 18)

            Button {
                selectedTab = 2
            } label: {
                Image("solar_map-bold-duotone")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundColor(.white)
                    .padding(22)
                    .background(
                        Circle()
                            .fill(Color("Secondary"))
                            .shadow(radius: 6)
                    )
            }
            .offset(y: -20)
        }
    }

    private func navButton(index: Int, icon: String) -> some View {
        Button {
            selectedTab = index
        } label: {
            Image(icon)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
                .foregroundColor(selectedTab == 2 ? Color("Color") : (Color("Secondary")))
        }
    }

}
#Preview {
    MainAppView()
}
