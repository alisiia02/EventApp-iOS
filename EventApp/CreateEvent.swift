import SwiftUI
import MapKit

struct CreateEventView: View {
    
    // UI States
    @State private var title = ""
    @State private var description = ""
    @State private var price = ""
    
    @State private var selectedImages: [Color] = []
    @State private var location: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            
            // HEADER
            HStack {
                Text("Create Event")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
            }
            .padding(.top, 50)
            .padding(.horizontal)
            .background(.white)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    // IMAGES CARD
                    Card {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Event Images")
                                .font(.headline)
                            
                                        
                            Button {
                                selectedImages.append([.blue, .purple, .orange, .pink].randomElement()!)
                            } label: {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [8]))
                                    .frame(height: 130)
                                    .overlay(
                                        Text("Tap to upload images")
                                            .foregroundColor(.gray)
                                    )
                            }
                            
                            if !selectedImages.isEmpty {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(0..<selectedImages.count, id: \.self) { i in
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(selectedImages[i])
                                                .frame(width: 110, height: 110)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    Card {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Event Title")
                                .font(.headline)
                            
                            TextField("Write title...", text: $title)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                            
                            Text("Description")
                                .font(.headline)
                            
                            TextField("Write short description...", text: $description, axis: .vertical)
                                .padding()
                                .frame(minHeight: 100, alignment: .topLeading)
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                        }
                    }
                    
                    // LOCATION CARD
                    Card {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Location")
                                .font(.headline)
                            
                            TextField("Enter location...", text: $location)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                        }
                    }
                    
                    // PRICE CARD
                    Card {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Price")
                                .font(.headline)
                            
                            TextField("Free or enter price...", text: $price)
                                .keyboardType(.decimalPad)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                        }
                    }
                    
                    Spacer().frame(height: 120)
                }
                .padding()
            }
            
            // CREATE BUTTON (sticky bottom)
            VStack {
                Button {
                    // front-end only → no action needed
                } label: {
                    Text("Create Event")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(title.isEmpty ? Color.blue.opacity(0.4) : Color.blue)
                        .cornerRadius(12)
                }
                .disabled(title.isEmpty)
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .background(.white)
        }
        .ignoresSafeArea(edges: .top)
    }
}


// MARK: - Card Component
struct Card<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            content
        }
        .padding()
        .background(Color.white)
        .cornerRadius(18)
        .shadow(color: Color.black.opacity(0.07), radius: 6, x: 0, y: 3)
    }
}
