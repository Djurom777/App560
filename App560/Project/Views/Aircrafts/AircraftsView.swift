//
//  AircraftsView.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI

struct AircraftsView: View {
    
    @StateObject var viewModel = AircraftsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Aircrafts")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Rectangle()
                    .fill(.gray.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                if viewModel.aircrafts.isEmpty {
                    
                    VStack(spacing: 12) {
                        
                        Image("airc")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 170)
                        
                        Text("The list is empty")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("Add available aircraft by clicking on the plus sign")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.aircrafts, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedAircraft = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(spacing: 10) {
                                        
                                        Image("airc")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 120)
                                        
                                        Text(index.airModel ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text(index.airSerial ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                            .frame(maxWidth: .infinity, alignment: .leading)

                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                    .padding(1)
                                })

                            }
                        })
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                        .padding(16)
                        .background(Circle().fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddAircraft(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            AirDetail(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchAircraft()
        }
    }
}

#Preview {
    AircraftsView()
}
