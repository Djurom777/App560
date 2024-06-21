//
//  R3.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("OBR3")
                    .resizable()
                    .ignoresSafeArea()
                
                Spacer()
                
                VStack(spacing: 12) {
                    
                    Text("Analyze your data")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("Automatic analysis will save specialist time")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .padding(.bottom, 40)
                    
                    Button(action: {
                        
                        status = true
                        
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
    R3()
}
