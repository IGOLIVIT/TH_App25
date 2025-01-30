//
//  obr1.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

struct obr1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("rob1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("Discover & Create")
                        .foregroundColor(.black)
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("Unlock the world of winemaking! Create and store your favorite wine recipes with precise details.")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        obr2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                    })
                    .padding(.bottom)
                }
                .padding()
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 300)
                .background(Color.white)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    obr1()
}
