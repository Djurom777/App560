//
//  U1.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("OBU1")
                    .resizable()
                    .ignoresSafeArea()
                
                Spacer()
                
                VStack(spacing: 12) {
                    
                    Text("How far will it fly?")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("Try your luck")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .padding(.bottom, 40)
                    
                    NavigationLink(destination: {
                        
                        Reviews()
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
    U1()
}