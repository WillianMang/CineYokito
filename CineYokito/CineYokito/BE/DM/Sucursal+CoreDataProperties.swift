//
//  Sucursal+CoreDataProperties.swift
//  CineYokito
//
//  Created by B303-22 on 1/12/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import Foundation
import CoreData
 

extension Sucursal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sucursal> {
        return NSFetchRequest<Sucursal>(entityName: "Sucursal");
    }

    @NSManaged public var sucursal_id: String?
    @NSManaged public var sucursal_nombre: String?
    @NSManaged public var horario: NSSet?

}

// MARK: Generated accessors for horario
extension Sucursal {

    @objc(addHorarioObject:)
    @NSManaged public func addToHorario(_ value: Horario)

    @objc(removeHorarioObject:)
    @NSManaged public func removeFromHorario(_ value: Horario)

    @objc(addHorario:)
    @NSManaged public func addToHorario(_ values: NSSet)

    @objc(removeHorario:)
    @NSManaged public func removeFromHorario(_ values: NSSet)

}
