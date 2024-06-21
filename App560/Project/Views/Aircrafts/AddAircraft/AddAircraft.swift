//
//  AddAircraft.swift
//  App560
//
//  Created by IGOR on 20/06/2024.
//

import SwiftUI

struct AddAircraft: View {
    
    @StateObject var viewModel: AircraftsViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New aircraft")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Model")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.airModel.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.airModel)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    .padding(1)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Serial number")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.airSerial.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.airSerial)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    .padding(1)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Number of flights")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.airNumFlights.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.airNumFlights)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    .padding(1)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Flight hours")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.airFHours.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.airFHours)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    .padding(1)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                    .padding(1)
                    .padding(.bottom)
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Last inspection")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .semibold))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Date")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.airLastIns.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.airLastIns)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            .padding(1)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                            .padding(1)
                            .padding(.bottom)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading) {

                            Text("Upcoming inspection")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .semibold))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Date")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.airUpIns.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.airUpIns)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            .padding(1)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                            .padding(1)
                            .padding(.bottom)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    VStack(alignment: .leading) {

                        Text("Type of transportation")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .semibold))
                        
                        HStack {
                            
                            ForEach(viewModel.typeAir, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentType = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .stroke(Color.gray, lineWidth: 2)
                                                .frame(width: 20)
                                            
                                            Circle()
                                                .fill(Color("prim"))
                                                .frame(width: 12)
                                                .opacity(viewModel.currentType == index ? 1 : 0)
                                        }
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .medium))
                                        
                                        Spacer()
                                        
                                    }
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                        .padding(1)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim").opacity(viewModel.currentType == index ? 1 : 0)))
                                        .padding(1)
                                })
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Button(action: {
                    
                    viewModel.totalAir += 1
                    viewModel.totalAir2 += 1

                    viewModel.airType = viewModel.currentType
                    
                    viewModel.addAircraft()
                    
                    viewModel.airModel = ""
                    viewModel.currentType = ""
                    viewModel.airSerial = ""
                    viewModel.airNumFlights = ""
                    viewModel.airFHours = ""
                    viewModel.airUpIns = ""
                    viewModel.airLastIns = ""
                    
                    viewModel.fetchAircraft()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .opacity(viewModel.airModel.isEmpty || viewModel.airSerial.isEmpty || viewModel.airLastIns.isEmpty || viewModel.airUpIns.isEmpty || viewModel.airNumFlights.isEmpty || viewModel.airFHours.isEmpty ? 0.5 : 1)
                .disabled(viewModel.airModel.isEmpty || viewModel.airSerial.isEmpty || viewModel.airLastIns.isEmpty || viewModel.airUpIns.isEmpty || viewModel.airNumFlights.isEmpty || viewModel.airFHours.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddAircraft(viewModel: AircraftsViewModel())
}
