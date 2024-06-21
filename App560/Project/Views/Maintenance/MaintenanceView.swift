//
//  MaintenanceView.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI

struct MaintenanceView: View {
    
    @StateObject var viewModel = MaintenanceViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Maintenance")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Rectangle()
                    .fill(.gray.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.bottom)
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.currentType = index
                            
                            viewModel.fetchPasts()
                            viewModel.fetchAircraft()
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 23)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim").opacity(viewModel.currentType == index ? 1 : 0)))
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 24)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                .padding(.bottom)
                
                if viewModel.currentType == "Upcoming" {
                    
                    if viewModel.getUpcoming().isEmpty {
                        
                        VStack(spacing: 12) {
                            
                            Image("doctext")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 180)
                            
                            Text("The list is empty")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Text("Add available aircraft by clicking on the plus sign")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.getUpcoming(), id: \.self) { index in
                                
                                    HStack {
                                        
                                        Image(systemName: "gearshape.arrow.triangle.2.circlepath")
                                            .foregroundColor(.gray.opacity(0.5))
                                            .font(.system(size: 28, weight: .bold))
                                        .padding(.horizontal)
                                        
                                        VStack(alignment: .leading, spacing: 6) {
                                            
                                            Text(index.airModel ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            HStack {
                                                
                                                Text("#")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.airSerial ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13, weight: .regular))
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedAircraft = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isAddPast = true
                                            }
                                            
                                        }, label: {
                                            
                                            Text("Start")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                                .padding(5)
                                                .padding(.horizontal, 5)
                                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                        })
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                }
                            }
                        }
                    }
                    
                } else if viewModel.currentType == "Past" {
                    
                    if viewModel.pasts.isEmpty {
                        
                        VStack(spacing: 12) {
                            
                            Image("doctext")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 180)
                            
                            Text("The list is empty")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.pasts, id: \.self) { index in
                                
                                    HStack {
                                        
                                        Image(systemName: "gearshape.arrow.triangle.2.circlepath")
                                            .foregroundColor(.gray.opacity(0.5))
                                            .font(.system(size: 28, weight: .bold))
                                        .padding(.horizontal)
                                        
                                        VStack(alignment: .leading, spacing: 6) {
                                            
                                            Text(index.pastModel ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))

                                                Text(index.pastPartsType ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 11, weight: .regular))
                                                    .padding(3)
                                                    .padding(.horizontal, 2)
                                                    .background(RoundedRectangle(cornerRadius: 6).fill(Color("prim")))
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedPast = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "arrow.right")
                                                .foregroundColor(.white)
                                                .font(.system(size: 24, weight: .semibold))
                                        })
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                    .padding(1)
                                }
                            }
                        }
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
        .onAppear {
            
            viewModel.fetchAircraft()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AirChoose(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddPast, content: {
            
            AddPast(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchPasts()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            PastDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    MaintenanceView()
}
