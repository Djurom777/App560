//
//  MaintenanceViewModel.swift
//  App560
//
//  Created by IGOR on 20/06/2024.
//

import SwiftUI
import CoreData

final class MaintenanceViewModel: ObservableObject {
    
    @AppStorage("totalAir") var totalAir: Int = 0
    @AppStorage("UnRev") var UnRev: Int = 0
    @AppStorage("Satis") var Satis: Int = 0
    @AppStorage("onRep") var onRep: Int = 0
    
    @Published var types: [String] = ["Upcoming", "Past"]
    @Published var currentType = "Upcoming"
    
    @Published var typesPast: [String] = ["Okay", "On repair"]
    @Published var currentTypePast = "Okay"

    @Published var isAdd: Bool = false
    @Published var isAddCat: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddPast: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var airModel = ""
    @Published var airSerial = ""
    @Published var airNumFlights = ""
    @Published var airFHours = ""
    @Published var airLastIns = ""
    @Published var airUpIns = ""
    @Published var airType = ""

    @Published var aircrafts: [AircModel] = []
    @Published var selectedAircraft: AircModel?
    
    func addAircraft() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "AircModel", into: context) as! AircModel
        
        loan.airModel = airModel
        loan.airSerial = airSerial
        loan.airNumFlights = airNumFlights
        loan.airFHours = airFHours
        loan.airLastIns = airLastIns
        loan.airUpIns = airUpIns
        loan.airType = airType

        CoreDataStack.shared.saveContext()
    }
    
    func fetchAircraft() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AircModel>(entityName: "AircModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.aircrafts = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.aircrafts = []
        }
    }
    
    @Published var pastModel = ""
    @Published var pastSerial = ""
    @Published var pastType = ""
    @Published var pastDate = ""
    @Published var pastET = ""
    @Published var pastFuel = ""
    @Published var pastFC = ""
    @Published var pastPartsType = ""

    @Published var pasts: [PastModel] = []
    @Published var selectedPast: PastModel?
    
    func addPast() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PastModel", into: context) as! PastModel
        
        loan.pastModel = pastModel
        loan.pastSerial = pastSerial
        loan.pastType = pastType
        loan.pastDate = pastDate
        loan.pastET = pastET
        loan.pastFuel = pastFuel
        loan.pastFC = pastFC
        loan.pastPartsType = pastPartsType

        CoreDataStack.shared.saveContext()
    }
    
    func fetchPasts() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PastModel>(entityName: "PastModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.pasts = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.pasts = []
        }
    }
    
    @AppStorage("UpcomingPlanes") var UpcomingPlanes: [String] = []
    
    func getUpcoming() -> [AircModel] {
        
        return aircrafts.filter{UpcomingPlanes.contains($0.airModel ?? "")}
    }
    
    func favoritesManager(model: AircModel) {
        
            
            if UpcomingPlanes.contains(model.airModel ?? "") {
                
                if let indexer = UpcomingPlanes.firstIndex(of: model.airModel ?? "") {
                    
                    UpcomingPlanes.remove(at: indexer)
                }
                
            } else {
                
                UpcomingPlanes.append(model.airModel ?? "")
            }

    }
    
    @AppStorage("PastPlanes") var PastPlanes: [String] = []
    
    func getPastcoming() -> [AircModel] {
        
        return aircrafts.filter{PastPlanes.contains($0.airModel ?? "")}
    }
    
    func favoritesManager2(model: AircModel) {
        
            
            if PastPlanes.contains(model.airModel ?? "") {
                
                if let indexer = UpcomingPlanes.firstIndex(of: model.airModel ?? "") {
                    
                    PastPlanes.remove(at: indexer)
                }
                
            } else {
                
                PastPlanes.append(model.airModel ?? "")
            }

    }
}
