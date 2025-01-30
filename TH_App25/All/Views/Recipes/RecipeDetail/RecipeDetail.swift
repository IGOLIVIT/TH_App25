//
//  RecipeDetail.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

struct RecipeDetail: View {
    
    @StateObject var viewModel: RecipesViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Recipe")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDetail = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .semibold))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(Color.red)
                                .font(.system(size: 18, weight: .regular))
                        })
                    }
                }
                .padding(.bottom, 23)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 25) {
                        
                        Text(viewModel.selectedRec?.reName ?? "")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 19, weight: .semibold))
                        
                        Text("Grape variety")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedRec?.reGrape ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .padding(7)
                        
                        Text("Ingredients")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedRec?.reIng ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .padding(7)
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Temperature mode")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 14, weight: .regular))
                                
                                HStack {
                                    
                                    Text(viewModel.selectedRec?.reTemp ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                        .padding(7)
                                    
                                    Text(viewModel.selectedRec?.reTMode ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Fermentation time")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text(viewModel.selectedRec?.reDays ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(7)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Text("Preparation description")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedRec?.reDescr ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .padding(7)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
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
                            
                            CoreDataStack.shared.deleteRec(withReIng: viewModel.selectedRec?.reIng ?? "", completion: {
                                
                                viewModel.fetchRecs()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                
                                viewModel.isDetail = false
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
    RecipeDetail(viewModel: RecipesViewModel())
}
