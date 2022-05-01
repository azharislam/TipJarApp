//
//  SavedPayment+CoreDataProperties.swift
//  TipJar
//
//  Created by Azhar Islam on 01/05/2022.
//
//

import Foundation
import CoreData


extension SavedPayment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedPayment> {
        return NSFetchRequest<SavedPayment>(entityName: "SavedPayment")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var savedDate: Date?
    @NSManaged public var savedImage: String?
    @NSManaged public var savedAmount: String?
    @NSManaged public var totalTip: String?

    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var date: String {
        savedDate?.customDate ?? ""
    }
    
    public var image: String {
        savedImage ?? ""
    }
    
    public var totalAmount: String {
        savedAmount ?? ""
    }
    
    public var tipTotal: String {
        totalTip ?? ""
    }
}

extension SavedPayment : Identifiable {

}
