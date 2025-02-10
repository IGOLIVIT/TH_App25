//
//  SettingsView.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
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
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 32, weight: .bold))
                    
                    Spacer()
                    
                }
                .padding(.bottom, 23)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 15) {

                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Rate App")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .regular))
                                
                                Text("Enjoying FermentPath? Leave us a review!")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 45.0).fill(Color("bg")).shadow(color: .gray.opacity(0.4), radius: 3))
                            .padding(4)
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/03f04b3b-7855-4e98-b0dd-cf94f463cd07") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Usage Policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .regular))
                                
                                Text("Read our terms and policies for using FermentPath.")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 45.0).fill(Color("bg")).shadow(color: .gray.opacity(0.4), radius: 3))
                            .padding(4)
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteAll = true
                            }
                            
                        }, label: {
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Delete all data")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .regular))
                                
                                Text("All added data will be deleted.")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 45.0).fill(Color.red).shadow(color: .gray.opacity(0.4), radius: 3))
                            .padding(4)
                        })
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteAll ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteAll = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("App Reset")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    Text("Are you sure you want to delete all data and restore the app to its original state? This action cannot be undone.")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Rectangle()
                        .fill(Color("bg"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 7)
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteAll = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteAllData()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteAll = false
                            }
                            
                        }, label: {
                            
                            Text("Reset")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })

                    }

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg").opacity(0.9)))
                .padding()
                .offset(y: viewModel.isDeleteAll ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
