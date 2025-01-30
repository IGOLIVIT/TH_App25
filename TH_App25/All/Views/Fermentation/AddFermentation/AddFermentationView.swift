//
//  AddFermentationView.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

struct AddFermentationView: View {

    @StateObject var viewModel: FermentationViewModel
    @StateObject var mainModel = LibraryViewModel()
    
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
                            
                            viewModel.feWine = viewModel.currentWine
                            
                            viewModel.addFerm()
                            
                            viewModel.currentWine = ""
                            viewModel.feTime = ""
                            
                            viewModel.fetchFerms()
  
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .semibold))
                        })
                        .opacity(viewModel.currentWine.isEmpty || viewModel.feTime.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.currentWine.isEmpty || viewModel.feTime.isEmpty ? true : false)
                    }
                }
                .padding(.bottom, 23)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 25) {
                        
                        Text("Wine")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Menu(content: {
                            
                            ForEach(mainModel.libraries, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentWine = index.title
                                    
                                }, label: {
                                    
                                    Text(index.title)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentWine.isEmpty {
                                
                                HStack {
                                    
                                    Text("Select wine")
                                        .foregroundColor(.gray.opacity(0.6))
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.gray.opacity(0.6))
                                        .font(.system(size: 17, weight: .regular))
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(viewModel.currentWine)
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.gray.opacity(0.6))
                                        .font(.system(size: 17, weight: .regular))
                                }
                            }
                            
                        })
                        .padding(7)

                        
                        Text("Fermentation time")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Days")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.feTime.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.feTime)
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
    AddFermentationView(viewModel: FermentationViewModel())
}
