//
//  PaymentEntity+CoreDataProperties.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//
//

import Foundation
import CoreData


extension PaymentEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PaymentEntity> {
        return NSFetchRequest<PaymentEntity>(entityName: "PaymentEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var receiptDate: Date?
    @NSManaged public var amount: NSDecimalNumber?
    @NSManaged public var tipAmount: NSDecimalNumber?
    @NSManaged public var receiptImage: String?

}

extension PaymentEntity : Identifiable {

}
