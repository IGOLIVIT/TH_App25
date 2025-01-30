//
//  LibraryView.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

struct LibraryView: View {

    @StateObject var viewModel = LibraryViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
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
                .disabled(true)
                .opacity(0)
                
                HStack {
                    
                    Text("Wine library")
                        .foregroundColor(.black)
                        .font(.system(size: 32, weight: .bold))
                    
                    Spacer()
                    
                }

                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.libraries, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedLibrary = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 17) {
                                        
                                        Text(index.title)
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 19, weight: .semibold))
                                            .lineLimit(1)

                                        HStack {
                                            
                                            Text(index.region)
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
            .padding()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            LibraryDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    LibraryView()
}
