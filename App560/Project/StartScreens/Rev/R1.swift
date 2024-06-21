//
//  R1.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("OBR1")
                    .resizable()
                    .ignoresSafeArea()
                
                Spacer()
                
                VStack(spacing: 12) {
                    
                    Text("Add models to the list")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("All the necessary information in one place")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .padding(.bottom, 40)
                    
                    NavigationLink(destination: {
                        
                        R2()
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
    R1()
}
