//
//  LoadingView.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("lv")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Image("logoob")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(90)
                    .padding(.bottom, 210)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
