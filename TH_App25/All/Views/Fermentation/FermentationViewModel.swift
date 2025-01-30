//
//  FermentationViewModel.swift
//  TH_App25
//
//  Created by IGOR on 30/01/2025.
//

import SwiftUI
import CoreData

final class FermentationViewModel: ObservableObject {
    
    @Published var currentWine: String = ""
    @Published var remainingDays: Int = 0


    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false

    @Published var feWine: String = ""
    @Published var feTime: String = ""
    @Published var feTimer: String = ""
    @Published var feRemainDays: Int = 0

    @Published var tModes: [String] = ["℃", "℉"]
    @Published var currentTMode: String = "℃"

    @Published var fermentations: [FermModel] = []
    @Published var selectedFerm: FermModel?

    func addFerm() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "FermModel", into: context) as! FermModel

        loan.feWine = feWine
        loan.feTimer = false
       loan.feTime = Int16(feTime) ?? 0
        loan.feRemainDays = Int16(feRemainDays) 


        CoreDataStack.shared.saveContext()
    }

    func fetchFerms() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FermModel>(entityName: "FermModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.fermentations = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.fermentations = []
        }
    }
    
    @Published var isTimerRunning = false
    
     func startTimer() {
          isTimerRunning = true
          UserDefaults.standard.set(Date(), forKey: "lastUpdateDate") // Сохраняем дату запуска
      }
      
      // Проверяем, прошло ли 24 часа с последнего обновления
     func checkAndUpdateDays() {
        let lastUpdate = UserDefaults.standard.object(forKey: "lastUpdateDate") as? Date ?? Date()
        let currentDate = Date()
        
        if Calendar.current.isDate(lastUpdate, inSameDayAs: currentDate) {
            return // Если уже обновляли сегодня, ничего не делаем
        }
        
        // Вычитаем 1 день
        remainingDays = max(remainingDays - 1, 0)
        UserDefaults.standard.set(remainingDays, forKey: "remainingDays")
        UserDefaults.standard.set(currentDate, forKey: "lastUpdateDate")
        
    }

}
