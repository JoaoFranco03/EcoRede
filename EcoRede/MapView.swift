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
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemPink))
                .onAppear {
                    viewModel.checkifLocationServicesIsEnabled()
                }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
