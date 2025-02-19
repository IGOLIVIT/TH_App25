//
//  U1.swift
//  TH_App25
//
//  Created by IGOR on 19/02/2025.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("us1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("WELCOME TO CRAZY TIME!")
                        .foregroundColor(.black)
                        .font(.system(size: 27, weight: .bold))
                    
                    Text("Try your luck, play, and win.")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
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
                .frame(height: 270)
                .background(Color.white)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    U1()
}
