//
//  AnalyticsView.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI

struct AnalyticsView: View {
    
    @StateObject var viewModel = AnalyticsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Analytics")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Rectangle()
                    .fill(.gray.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack {
                        
                        Circle()
                            .stroke(Color.gray.opacity(0.5), lineWidth: 11)
                            .frame(width: 160)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(calculatePercentage() / 100))
                            .stroke(Color("prim"), lineWidth: 11)
                            .frame(width: 160)
                            .rotationEffect(.degrees(-90))
                        
                        VStack {
                            
                            Text("\(viewModel.Satis)/\(viewModel.totalAir)")
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .semibold))
                            
                            Text("VERIFIED")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .semibold))
                        }
                        
                    }
                    .padding()
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Total aircrafts")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            Spacer()
                            
                            Text("\(viewModel.totalAir)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray))
                        .padding(1)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Under review")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            Spacer()
                            
                            Text("\(viewModel.UnRev)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray))
                        .padding(1)
                        
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Satisfactory")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            Spacer()
                            
                            Text("\(viewModel.Satis)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray))
                        .padding(1)
                        
                        VStack(alignment: .leading) {
                            
                            Text("On repair")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            Spacer()
                            
                            Text("\(viewModel.onRep)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray))
                        .padding(1)
                        
                    }
                }
             }
            .padding()
        }
    }
    
    func calculatePercentage() -> Double {
        
        let value = Int(viewModel.Satis)
        let maxValue = Int(viewModel.totalAir2)
        
        let percentCircle = (Double(value) / Double(maxValue)) * 100
        
        return percentCircle
    }

}

#Preview {
    AnalyticsView()
}
