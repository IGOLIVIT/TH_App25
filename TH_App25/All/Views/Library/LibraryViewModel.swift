//
//  LibraryViewModel.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI

final class LibraryViewModel: ObservableObject {
    
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false
    @Published var isDeleteAll: Bool = false
    
    @Published var selectedLibrary: LibraryModel?

    @Published var libraries: [LibraryModel] = [
        
        LibraryModel(title: "Cabernet Sauvignon", flavor: "Full-bodied, rich tannins, blackcurrant, cedar, tobacco", food: "Red meat, aged cheese, grilled vegetables", origin: "Originated in the 17th century in Bordeaux, France, as a natural cross between Cabernet Franc and Sauvignon Blanc. It quickly became one of the world’s most recognized red wine grapes due to its aging potential and bold flavors", region: "France, USA (Napa Valley), Chile, Australia"),
        
        LibraryModel(title: "Pinot Noir", flavor: "Light-bodied, red berries, earthy, silky texture", food: "Duck, salmon, soft cheeses", origin: "One of the oldest grape varieties, dating back to the Roman era in Burgundy, France. Its name means 'black pine' due to its tightly clustered, pinecone-shaped grape bunches. Pinot Noir is famous for its delicate structure and complex flavors.", region: "France, USA (Oregon, California), New Zealand"),
        
        LibraryModel(title: "Merlot", flavor: "Medium-bodied, plummy, smooth tannins, chocolate notes", food: "Roast chicken, pasta, mild cheeses", origin: "Originated in Bordeaux, France, first recorded in the 18th century. The name 'Merlot' is believed to come from the French word for 'blackbird' (merle), referring to the grape’s dark color. It gained popularity due to its smooth and approachable character. Flavor Profile: Medium-bodied, plummy, smooth tannins, chocolate notes'", region: "France, USA, Chile, Italy'"),
        
        LibraryModel(title: "Chardonnay", flavor: "Medium to full-bodied, buttery, vanilla, citrus", food: "Seafood, roasted chicken, creamy pasta", origin: "Traced back to Burgundy, France, where it has been cultivated for over a thousand years. The grape is named after the village of Chardonnay in the region. It is one of the most versatile white wine grapes, adapting to various climates and winemaking styles", region: "France, USA, Australia, South Africa"),
        
        LibraryModel(title: "Sauvignon Blanc", flavor: "Crisp, high acidity, green apple, grassy, citrus", food: "Goat cheese, shellfish, salads", origin: "Native to Loire Valley and Bordeaux, France, with historical records dating back to the 16th century. Its name means 'wild white' in French, referencing its origins as an untamed grapevine. The variety became world-famous for its crisp acidity and fresh flavors", region: "France, New Zealand, Chile, USA"),
        
        LibraryModel(title: "Riesling", flavor: "Aromatic, high acidity, honey, peach, floral", food: "Spicy dishes, sushi, fruit-based desserts", origin: "First documented in 1435 in Germany, in the Rheingau region. Riesling became Germany’s flagship grape and is known for its ability to produce wines ranging from bone-dry to lusciously sweet. It thrives in cool climates and volcanic soils", region: "Germany, France (Alsace), USA, Australia"),
        
        LibraryModel(title: "Syrah (Shiraz)", flavor: "Full-bodied, spicy, dark fruit, smoky", food: "Barbecue, lamb, aged cheeses", origin: "Thought to have originated in France’s Rhône Valley, with evidence of cultivation dating back to 600 BC. Another legend links Syrah to the ancient Persian city of Shiraz, though no genetic evidence supports this. It is known for its bold, spicy character", region: "France, Australia, South Africa, USA"),
        
        LibraryModel(title: "Zinfandel", flavor: "Bold, jammy, blackberries, peppery spice", food: "Grilled meats, pizza, barbecue", origin: "Originally from Croatia, where it was called Crljenak Kaštelanski, but it became famous in California in the 19th century. It was introduced by Italian immigrants and thrived in the warm climate, producing bold, fruit-forward wines", region: "USA (California), Italy (Primitivo)"),
                      ]

}
