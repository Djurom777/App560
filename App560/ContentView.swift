//
//  ContentView.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Aircrafts

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {
                        
                        AircraftsView()
                            .tag(Tab.Aircrafts)
                        
                        MaintenanceView()
                            .tag(Tab.Maintenance)
                        
                        AnalyticsView()
                            .tag(Tab.Analytics)
                        
                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
