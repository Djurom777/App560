//
//  AircraftsViewModel.swift
//  App560
//
//  Created by IGOR on 19/06/2024.
//

import SwiftUI
import CoreData

final class AircraftsViewModel: ObservableObject {
    
    @Published var typeAir: [String] = ["Passenger", "Cargo"]
    @Published var currentType = "Passenger"
    
    @AppStorage("totalAir") var totalAir: Int = 0
    @AppStorage("totalAir2") var totalAir2: Int = 1
    @AppStorage("UnRev") var UnRev: Int = 0
    @AppStorage("Satis") var Satis: Int = 0
    @AppStorage("onRep") var onRep: Int = 0
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
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
}
