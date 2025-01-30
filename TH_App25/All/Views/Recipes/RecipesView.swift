//
//  RecipesView.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

struct RecipesView: View {
    
    @StateObject var viewModel = RecipesViewModel()
    
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
                    
                    Text("+ New recipe")
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
                
                if viewModel.recipes.isEmpty {
                    
                    VStack(spacing: 16) {
                        
                        Image("ept1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                        
                        Text("You haven't added any wine recipes yet.")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                            .frame(width: 180)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("+ New recipe")
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
                            
                            ForEach(viewModel.recipes, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedRec = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 17) {
                                        
                                        Text(index.reName ?? "")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 19, weight: .semibold))
                                            .lineLimit(1)
                                        
                                        Text(index.reGrape ?? "")
                                            .foregroundColor(.black.opacity(0.7))
                                            .font(.system(size: 16, weight: .regular))
                                            .lineLimit(1)
                                        
                                        HStack {
                                            
                                            Text(index.reIng ?? "")
                                                .foregroundColor(.black.opacity(0.7))
                                                .font(.system(size: 16, weight: .regular))
                                                .frame(width: 200)
                                                .lineLimit(1)
                                            
                                            Spacer()
                                            
                                            Text("More information")
                                                .foregroundColor(.black.opacity(0.3))
                                                .font(.system(size: 16, weight: .regular))
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
            
            viewModel.fetchRecs()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddRecipe(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            RecipeDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    RecipesView()
}
