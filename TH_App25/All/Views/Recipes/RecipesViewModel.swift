//
//  RecipesViewModel.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI
import CoreData

final class RecipesViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false

    @Published var reGrape: String = ""
    @Published var reIng: String = ""
    @Published var reTemp: String = ""
    @Published var reDays: String = ""
    @Published var reDescr: String = ""
    @Published var reName: String = ""
    @Published var reTMode: String = ""

    @Published var tModes: [String] = ["℃", "℉"]
    @Published var currentTMode: String = "℃"

    @Published var recipes: [RecipeModel] = []
    @Published var selectedRec: RecipeModel?

    func addRec() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "RecipeModel", into: context) as! RecipeModel

        loan.reGrape = reGrape
        loan.reIng = reIng
        loan.reTemp = reTemp
        loan.reDays = reDays
        loan.reDescr = reDescr
        loan.reName = reName
        loan.reTMode = reTMode

        CoreDataStack.shared.saveContext()
    }

    func fetchRecs() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RecipeModel>(entityName: "RecipeModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.recipes = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.recipes = []
        }
    }

}
