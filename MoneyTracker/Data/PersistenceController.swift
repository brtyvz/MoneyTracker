//
//  PersistenceController.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 25.07.2022.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController ()
    
    let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    init (inMemory:Bool = false) {
        container = NSPersistentContainer(name: "MoneyTracker")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: {
            (storeDescription,error) in
            if let error = error as NSError? {
                fatalError( "Unresolved error\(error),\(error.userInfo)" )
            }
        })
    }
    func getItems(handler:@escaping([Item])->Void){
        let request = NSFetchRequest <Item>(entityName: "Item")
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)
        ]
        do {
            let results = try viewContext.fetch(request)
            handler(results)
        } catch let error {
            print(error.localizedDescription)
            handler([])
        }
    }
}
