//
//  FermentationView.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

struct FermentationView: View {

    @StateObject var viewModel = FermentationViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("+ New fermentation")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .padding(7)
                        .padding(.horizontal, 7)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                HStack {
                    
                    Text("Wine reciprs")
                        .foregroundColor(.black)
                        .font(.system(size: 32, weight: .bold))
                    
                    Spacer()
                    
                }
                
                if viewModel.fermentations.isEmpty {
                    
                    VStack(spacing: 16) {
                        
                        Image("ept2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                        
                        Text("You haven't recorded any fermentation processes yet.")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                            .frame(width: 250)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("+ New fermentation")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding(10)
                                .padding(.horizontal, 10)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                        })
                    }
                    .padding()
                    .frame(maxHeight: .infinity)
                    .padding(.top, 23)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.fermentations, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedFerm = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 17) {
                                        
                                        HStack {
                                            
                                            Text(index.feWine ?? "")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 19, weight: .semibold))
                                                .lineLimit(1)
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedFerm = index
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDelete = true
                                                }
                                                
                                            }, label: {
                                                
                                                Image(systemName: "trash")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 18, weight: .regular))
                                            })
                                        }
                                        
                                        Text("Fermentation time: \(index.feTime) days")
                                            .foregroundColor(.black.opacity(0.7))
                                            .font(.system(size: 16, weight: .regular))
                                            .lineLimit(1)
                                            
                                            if viewModel.isTimerRunning {
                                                
                                                HStack {
                                                    
                                                    Text("Remaining: \(viewModel.remainingDays)")
                                                        .foregroundColor(.black.opacity(0.7))
                                                        .font(.system(size: 16, weight: .regular))
                                                    
                                                    Spacer()
                                                    
                                                    Button(action: {
                                                                                                                
                                                        viewModel.remainingDays = Int(index.feTime)
                                                        
                                                        viewModel.startTimer()
                                                        
                                                    }, label: {
                                                        
                                                        Text("Start")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 14, weight: .regular))
                                                            .padding(6)
                                                            .padding(.horizontal, 6)
                                                            .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                                                    })
                                                    .opacity(0.5)
                                                    .disabled(true)
                                                }
                                                
                                            } else {
                                                
                                                HStack {
                                                    
                                                    Text("Remaining: \(index.feTime)")
                                                        .foregroundColor(.black.opacity(0.7))
                                                        .font(.system(size: 16, weight: .regular))
                                                    
                                                    Spacer()
                                                    
                                                    Button(action: {
                                                        
                                                        viewModel.remainingDays = Int(index.feTime)
                                                        
                                                        viewModel.startTimer()
                                                        
                                                    }, label: {
                                                        
                                                        Text("Start")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 14, weight: .regular))
                                                            .padding(6)
                                                            .padding(.horizontal, 6)
                                                            .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                                                    })
                                                }
                                            }
                                    }
                                    .padding(20)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg")).shadow(color: .gray.opacity(0.4), radius: 3))
                                    .padding(4)
                                })
                            }
                        }
                        .padding(.top, 23)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchFerms()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddFermentationView(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Delete?")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    Text("This action can not be undone")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))

                    Rectangle()
                        .fill(Color("bg"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 7)
                    
                    HStack {
                        
                        Button(action: {
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteFerm(withFeWine: viewModel.selectedFerm?.feWine ?? "", completion: {
                                
                                viewModel.fetchFerms()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 17, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                    .padding(.top, 25)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    FermentationView()
}
