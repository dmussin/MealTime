//
//  MealTime+CoreDataProperties.swift
//  MealTime
//
//  Created by Daniyar Mussin on 06.06.2021.
//
//

import Foundation
import CoreData


extension MealTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealTime> {
        return NSFetchRequest<MealTime>(entityName: "MealTime")
    }

    @NSManaged public var meals: NSObject?

}

extension MealTime : Identifiable {

}
