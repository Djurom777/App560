//
//  SettingsView.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Rectangle()
                    .fill(.gray.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/77b00d6b-5212-4fb9-961a-798a9ff1889f") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "doc.text")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 15, weight: .regular))
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Rate Us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 15, weight: .regular))
                            }                     
                        })

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
