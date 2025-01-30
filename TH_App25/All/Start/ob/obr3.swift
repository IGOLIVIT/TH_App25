//
//  obr3.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

struct obr3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("rob3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("Explore Wine Library")
                        .foregroundColor(.black)
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("Learn about the finest wines, their origins, and perfect food pairings to enhance your experience.")
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
                .frame(height: 300)
                .background(Color.white)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    obr3()
}
