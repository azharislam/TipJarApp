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
        return NSFetchRequest<SavedPayment>(entityName: Constants.DataModel.entity)
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
        savedDate?.customDate ?? Constants.App.emptyString
    }
    
    public var image: String {
        savedImage ?? Constants.App.emptyString
    }
    
    public var totalAmount: String {
        savedAmount ?? Constants.App.emptyString
    }
    
    public var tipTotal: String {
        totalTip ?? Constants.App.emptyString
    }
}

extension SavedPayment : Identifiable {}
