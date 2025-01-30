//
//  LoadingView.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                 
                    VStack {
                        
                        Spacer()
                        
                        ProgressView()
                            .padding(.bottom, 120)
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
