//
//  Resumen+CoreDataProperties.swift
//  CineYokito
//
//  Created by B303-22 on 3/11/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import Foundation
import CoreData


extension Resumen {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Resumen> {
        return NSFetchRequest<Resumen>(entityName: "Resumen");
    }

    @NSManaged public var resumen_id: String?
    @NSManaged public var pelicula: Pelicula?

}
