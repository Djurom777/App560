//
//  AddPast.swift
//  App560
//
//  Created by IGOR on 20/06/2024.
//

import SwiftUI

struct AddPast: View {
    
    @StateObject var viewModel: MaintenanceViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text(viewModel.selectedAircraft?.airModel ?? "Airbus A300 B4")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                
                Text(viewModel.selectedAircraft?.airSerial ?? "03400-03450")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.bottom)
                
                Text(viewModel.selectedAircraft?.airType ?? "Passenger")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .regular))
                    .padding(4)
                    .padding(.horizontal, 3)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Date of inspection")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.pastDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.pastDate)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding(1)
                        
                        HStack {
                            
                            Text("Engine temperature")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.pastET.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.pastET)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding(1)
                        
                        HStack {
                            
                            Text("Air pressure")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.pastFuel.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.pastFuel)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding(1)
                        
                        HStack {
                            
                            Text("Fuel consumption")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.pastFC.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.pastFC)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding(1)
                        .padding(.bottom)
                        
                        VStack(alignment: .leading) {

                            Text("Type of transportation")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .semibold))
                            
                            HStack {
                                
                                ForEach(viewModel.typesPast, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentTypePast = index
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            ZStack {
                                                
                                                Circle()
                                                    .stroke(Color.gray, lineWidth: 2)
                                                    .frame(width: 20)
                                                
                                                Circle()
                                                    .fill(Color("prim"))
                                                    .frame(width: 12)
                                                    .opacity(viewModel.currentTypePast == index ? 1 : 0)
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
                                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim").opacity(viewModel.currentTypePast == index ? 1 : 0)))
                                            .padding(1)
                                    })
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)

                    }
                }
                
                Button(action: {
                    
                    if viewModel.currentTypePast == "Okay" {
                        
                        viewModel.Satis += 1
                        
                    } else {
                        
                        viewModel.onRep += 1
                    }
                    
                    viewModel.pastModel = viewModel.selectedAircraft?.airModel ?? ""
                    viewModel.pastType = viewModel.selectedAircraft?.airType ?? ""
                    viewModel.pastSerial = viewModel.selectedAircraft?.airSerial ?? ""
                    
                    viewModel.pastPartsType = viewModel.currentTypePast
                    
                    viewModel.addPast()
                    
                    viewModel.pastDate = ""
                    viewModel.pastET = ""
                    viewModel.pastFuel = ""
                    viewModel.pastFC = ""
                    
                    viewModel.fetchPasts()
                    
                    withAnimation(.spring()) {
                        
                        router.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .opacity(viewModel.pastDate.isEmpty || viewModel.pastET.isEmpty || viewModel.pastFuel.isEmpty || viewModel.pastFC.isEmpty ? 0.5 : 1)
                .disabled(viewModel.pastDate.isEmpty || viewModel.pastET.isEmpty || viewModel.pastFuel.isEmpty || viewModel.pastFC.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddPast(viewModel: MaintenanceViewModel())
}
