//
//  Category+CoreDataProperties.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 14.07.2022.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: Item?

}

extension Category : Identifiable {

}
