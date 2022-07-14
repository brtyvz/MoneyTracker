//
//  Item+CoreDataProperties.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 14.07.2022.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var note: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var value: Double
    @NSManaged public var category: Category?

}

extension Item : Identifiable {

}
