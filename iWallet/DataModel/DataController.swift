//
//  DataController.swift
//  iWallet
//
//  Created by Ilya Kozhevnikov on 08.06.2022.
//

import Foundation
import CoreData

enum Currency: String {
    case ruble = "RUR"
    case euro = "EUR"
    case usd = "USD"
}

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ActiveModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Error of loading data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!")
        } catch {
            print("we could not save the date.")
        }
    }
    
    func addActive(
        type: String,
        account: String,
        name: String,
        currency: String,
        value: Double,
        targetShare: Double,
        context: NSManagedObjectContext
    ) {
        let active = Active(context: context)
        active.id = UUID()
        active.type = type
        active.account = account
        active.name = name
        active.currency = currency
        active.value = value
        active.targetShare = targetShare
        
        save(context: context)
    }
    
    func editActive(
        active: Active,
        type: String,
        account: String,
        name: String,
        currency: Currency,
        value: Double,
        targetShare: Double,
        context: NSManagedObjectContext
    ) {
        active.type = type
        active.account = account
        active.name = name
        active.currency = currency.rawValue
        active.value = value
        active.targetShare = targetShare
        
        save(context: context)
    }
}
