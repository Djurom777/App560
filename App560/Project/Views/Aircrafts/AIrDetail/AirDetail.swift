//
//  AirDetail.swift
//  App560
//
//  Created by IGOR on 20/06/2024.
//

import SwiftUI

struct AirDetail: View {

    @StateObject var viewModel: AircraftsViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text(viewModel.selectedAircraft?.airModel ?? "")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                
                Text(viewModel.selectedAircraft?.airSerial ?? "")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text(viewModel.selectedAircraft?.airType ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .padding(4)
                            .padding(.horizontal, 3)
                            .background(RoundedRectangle(cornerRadius: 4).fill(Color("prim")))
                        
                        Image("aircl")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .padding(.bottom)
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Text("Number of flights")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text(viewModel.selectedAircraft?.airNumFlights ?? "0")
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
                                
                                Text("Flight hours")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text(viewModel.selectedAircraft?.airFHours ?? "0")
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
                                
                                Text("Last inspection")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text(viewModel.selectedAircraft?.airLastIns ?? "")
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
                                
                                Text("Upcoming inspection")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text(viewModel.selectedAircraft?.airUpIns ?? "")
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
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Text("Delete")
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
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteAir(withAirModel: viewModel.selectedAircraft?.airModel ?? "", completion: {
                            
                            viewModel.fetchAircraft()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    AirDetail(viewModel: AircraftsViewModel())
}
