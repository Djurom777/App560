//
//  AirChoose.swift
//  App560
//
//  Created by IGOR on 20/06/2024.
//

import SwiftUI

struct AirChoose: View {
    
    @StateObject var viewModel: MaintenanceViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            
            VStack {
                
                Text("Choose a flight")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.aircrafts, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedAircraft = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .stroke(Color.gray, lineWidth: 2)
                                            .frame(width: 20)
                                        
                                        Circle()
                                            .fill(Color("prim"))
                                            .frame(width: 12)
                                            .opacity(viewModel.selectedAircraft == index ? 1 : 0)
                                    }
                                    .padding(.horizontal)
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        
                                        Text(index.airModel ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        HStack {
                                            
                                            Text("Serial number:")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Text(index.airSerial ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            })
                        }
                    }
                 }
                
                Button(action: {
                    
                    viewModel.UnRev += 1
                    
                   if viewModel.UpcomingPlanes.contains(viewModel.selectedAircraft?.airModel ?? "") {
                        
                        if let indexer = viewModel.UpcomingPlanes.firstIndex(of: viewModel.selectedAircraft?.airModel ?? "") {
                            
                            viewModel.UpcomingPlanes.remove(at: indexer)
                            
                        }
                        
                    } else {
                        
                        viewModel.UpcomingPlanes.append(viewModel.selectedAircraft?.airModel ?? "")
                    }
                    
                    withanimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                        
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
            }
            .padding()
        }
        .onAppear{
            
            viewModel.fetchAircraft()
        }
    }
}

#Preview {
    AirChoose(viewModel: MaintenanceViewModel())
}
