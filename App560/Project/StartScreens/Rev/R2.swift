//
//  R2.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("OBR2")
                    .resizable()
                    .ignoresSafeArea()
                
                Spacer()
                
                VStack(spacing: 12) {
                    
                    Text("Track their parameters")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("Enter data on technical condition")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .padding(.bottom, 40)
                    
                    NavigationLink(destination: {
                        
                        R3()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .padding()
                }
            }
        }
    }
}

#Preview {
    R2()
}
