//
//  Reviews.swift
//  TH_App25
//
//  Created by IGOR on 19/02/2025.
//

import SwiftUI
import StoreKit

struct Reviews: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Re1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("Rate our app in the AppStore!")
                        .foregroundColor(.black)
                        .font(.system(size: 27, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Help us to become better.")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
