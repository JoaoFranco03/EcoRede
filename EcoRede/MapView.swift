//
//  ContentView.swift
//  EcoRede
//
//  Created by João Franco on 13/09/2022.
//

import MapKit
import SwiftUI

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var points: [Point] = []
    
    
    var body: some View {
        TabView{
            ZStack{
                Map(coordinateRegion: $viewModel.region,interactionModes: MapInteractionModes.all,showsUserLocation: true,annotationItems: points){
                    point in MapMarker(coordinate: CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude), tint: Color.blue)
                }
                .onAppear(perform: readFile)
                    .ignoresSafeArea()
                    .accentColor(Color(.systemPink))
                    .onAppear {
                        viewModel.checkifLocationServicesIsEnabled()
                    }
                
            }
            .tabItem {
                Image(systemName: "map")
                Text("Recycling Bins")
            }
            
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            // Use this appearance when scrolling behind the TabView:
            UITabBar.appearance().standardAppearance = appearance
            // Use this appearance when scrolled all the way up:
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    private func readFile() {
        if let url = Bundle.main.url(forResource: "points", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(JSONData.self, from: data) {
                self.points = jsonData.points
            }
        }
    }
}

struct JSONData: Decodable {
    let points:[Point]
}

struct Point: Decodable, Identifiable {
    let id: Int
    let latitude: Double
    let longitude: Double
    let eg: String
    let concelho: String
    let freguesia: String
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
