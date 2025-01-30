//
//  AddRecipe.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

struct AddRecipe: View {
    
    @StateObject var viewModel: RecipesViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New recipe")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .semibold))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.reTMode = viewModel.currentTMode
                            
                            viewModel.addRec()
                            
                            viewModel.reName = ""
                            viewModel.reGrape = ""
                            viewModel.reIng = ""
                            viewModel.reTemp = ""
                            viewModel.reDays = ""
                            viewModel.reDescr = ""
                            
                            viewModel.fetchRecs()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .semibold))
                        })
                        .opacity(viewModel.reName.isEmpty || viewModel.reGrape.isEmpty || viewModel.reDays.isEmpty || viewModel.reTemp.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.reName.isEmpty || viewModel.reGrape.isEmpty || viewModel.reDays.isEmpty || viewModel.reTemp.isEmpty ? true : false)
                    }
                }
                .padding(.bottom, 23)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 25) {
                        
                        Text("Wine name")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter wine name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.reName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.reName)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding(7)
                        
                        Text("Grape variety")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter grape variety")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.reGrape.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.reGrape)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding(7)
                        
                        Text("Ingredients")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter the ingredients separated by commas")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.reIng.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.reIng)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding(7)
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 15) {

                                Text("Temperature mode")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 14, weight: .regular))
                                
                                HStack {
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("0")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.reTemp.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.reTemp)
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                    })
                                    .padding(7)
                                 
                                    Menu(content: {
                                        
                                        ForEach(viewModel.tModes, id: \.self) { index in
                                        
                                            Button(action: {
                                                
                                                viewModel.currentTMode = index
                                                
                                            }, label: {
                                                
                                                Text(index)
                                            })
                                        }
                                        
                                    }, label: {
                                        
                                        Text(viewModel.currentTMode)
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.gray.opacity(0.5))
                                            .font(.system(size: 20, weight: .regular))
                                    })
                                    .padding(.trailing, 40)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 15) {

                                Text("Fermentation time")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 14, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Days")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.reDays.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.reDays)
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                })
                                .padding(7)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Text("Preparation description")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter Preparation description")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.reDescr.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.reDescr)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding(7)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddRecipe(viewModel: RecipesViewModel())
}
