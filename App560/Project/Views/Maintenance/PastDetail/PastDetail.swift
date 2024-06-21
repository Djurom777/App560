//
//  PastDetail.swift
//  App560
//
//  Created by IGOR on 20/06/2024.
//

import SwiftUI

struct PastDetail: View {
 
    @StateObject var viewModel: MaintenanceViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text(viewModel.selectedPast?.pastModel ?? "")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                
                Text(viewModel.selectedPast?.pastSerial ?? "")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text(viewModel.selectedPast?.pastType ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .padding(4)
                            .padding(.horizontal, 3)
                            .background(RoundedRectangle(cornerRadius: 4).fill(Color("prim")))
                            .padding(.bottom)
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Text("Date of inspection")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text(viewModel.selectedPast?.pastDate ?? "0")
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
                                
                                Text("Air pressure")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text(viewModel.selectedPast?.pastFuel ?? "0")
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
                                
                                Text("Engine temperature")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text(viewModel.selectedPast?.pastET ?? "")
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
                                
                                Text("Cheking parts")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text(viewModel.selectedPast?.pastPartsType ?? "")
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
                        
                        VStack(alignment: .leading) {
                            
                            Text("Fuel consumption")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            Spacer()
                            
                            Text(viewModel.selectedPast?.pastFC ?? "")
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
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
                        }
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
                        }
                        
                    }, label: {
                        
                        Text("Ok")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                }
            }
            .padding()
        }
    }
}

#Preview {
    PastDetail(viewModel: MaintenanceViewModel())
}
