//
//  Kondate+CoreDataProperties.swift
//  Kondate
//
//  Created by ryusei3 on 2017/05/31.
//  Copyright © 2017年 ryusei wakasa. All rights reserved.
//

import Foundation
import CoreData


extension Kondate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Kondate> {
        return NSFetchRequest<Kondate>(entityName: "Kondate")
    }

    @NSManaged public var asagohan: String?
    @NSManaged public var asagohanimage: NSData?
    @NSManaged public var date: NSDate?
    @NSManaged public var hirugohan: String?
    @NSManaged public var hirugohanimage: NSData?
    @NSManaged public var asalikenumber: Int32
    @NSManaged public var yorugohan: String?
    @NSManaged public var yorugohanimage: NSData?
    @NSManaged public var hirulikenumber: Int32
    @NSManaged public var yorulikenumber: Int32

}
