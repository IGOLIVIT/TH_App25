//
//  LibraryDetail.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

struct LibraryDetail: View {
    
    @StateObject var viewModel: LibraryViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Wine")
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

                    }
                }
                .padding(.bottom, 23)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 25) {
                        
                        Text(viewModel.selectedLibrary?.title ?? "")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 19, weight: .semibold))
                        
                        Text("Wine region")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedLibrary?.region ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .padding(7)
                        
                        Text("Flavor profile")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedLibrary?.flavor ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .padding(7)
                        
                        Text("Food pairings")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedLibrary?.food ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .padding(7)
                        
                        Text("Origin")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedLibrary?.origin ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
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
    LibraryDetail(viewModel: LibraryViewModel())
}
