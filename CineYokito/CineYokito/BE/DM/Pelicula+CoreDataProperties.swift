//
//  Pelicula+CoreDataProperties.swift
//  CineYokito
//
//  Created by B303-22 on 1/12/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import Foundation
import CoreData


extension Pelicula {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pelicula> {
        return NSFetchRequest<Pelicula>(entityName: "Pelicula");
    }

    @NSManaged public var peli_fecha: String?
    @NSManaged public var peli_genero: String?
    @NSManaged public var peli_id: String?
    @NSManaged public var peli_nombre: String?
    @NSManaged public var peli_resumen: String?
    @NSManaged public var peli_urlImagen: String?
    @NSManaged public var peli_director: String?
    @NSManaged public var horario: NSSet?

}

// MARK: Generated accessors for horario
extension Pelicula {

    @objc(addHorarioObject:)
    @NSManaged public func addToHorario(_ value: Horario)

    @objc(removeHorarioObject:)
    @NSManaged public func removeFromHorario(_ value: Horario)

    @objc(addHorario:)
    @NSManaged public func addToHorario(_ values: NSSet)

    @objc(removeHorario:)
    @NSManaged public func removeFromHorario(_ values: NSSet)

}
