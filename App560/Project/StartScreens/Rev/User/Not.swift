//
//  Not.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("OBUNot")
                    .resizable()
                    .ignoresSafeArea()
                
                Spacer()
                
                VStack(spacing: 12) {
                    
                    Text("Don’t miss anything")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("Will send all important notifications on time")
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
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Spacer()
                
            }
            .padding()
        }
    }
}

#Preview {
    Not()
}
