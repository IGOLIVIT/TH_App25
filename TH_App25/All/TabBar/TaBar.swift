//
//  TaBar.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Rectangle()
                            .fill(.gray.opacity(0.13))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color("prim").opacity(0.4))
                            .frame(width: 15, height: 15)

                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color("prim").opacity(0.4))
                            .font(.system(size: 11, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 24)
        .padding(.bottom, 38)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg")))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Recipes = "Wine recipes"
    
    case Fermentation = "Fermentation"
    
    case Library = "Wine library"
    
    case Settings = "Settings"

}
