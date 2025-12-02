//
//  MapView.swift
//  EventApp
//
//  Created by stud on 02/12/2025.
//

import SwiftUI
import MapKit

struct Event: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let description: String
}

struct EventMapView: View {
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.1079, longitude: 17.0385),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    
    @State private var events: [Event] = [
        Event(name: "Party Club", coordinate: CLLocationCoordinate2D(latitude: 51.107, longitude: 17.038), description: "Join the biggest party in Wrocław!")
    ]
    
    @State private var selectedEvent: Event? = nil
    @State private var showBottomSheet = false
    
    var body: some View {
        ZStack {
            // Map layer
            Map(position: $cameraPosition) {
                ForEach(events) { event in
                    Annotation(event.name, coordinate: event.coordinate) {
                        Button {
                            withAnimation(.spring()) {
                                selectedEvent = event
                                showBottomSheet = true
                            }
                        } label: {
                            Image(systemName: "mappin.circle.fill")
                                .font(.title)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            
            
            // Dark overlay when bottom sheet is visible
            if showBottomSheet {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showBottomSheet = false
                        }
                    }
            }
            
            // Bottom sheet
            if let event = selectedEvent, showBottomSheet {
                VStack {
                    Spacer()
                    
                    VStack(spacing: 16) {
                        Capsule()
                            .frame(width: 40, height: 5)
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.top, 8)
                        
                        Text(event.name)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text(event.description)
                            .foregroundColor(.white.opacity(0.9))
                        
                        Button(action: {
                            // open chat
                        }) {
                            Text("Join Chat")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [Color.purple, Color.blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    )
                    .frame(maxWidth: .infinity)
                    .transition(.move(edge: .bottom))
                }
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

// Helper to round only top corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = 10
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    EventMapView()
}
