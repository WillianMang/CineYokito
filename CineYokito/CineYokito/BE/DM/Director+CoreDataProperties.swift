//
//  Director+CoreDataProperties.swift
//  CineYokito
//
//  Created by B303-22 on 1/12/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import Foundation
import CoreData


extension Director {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Director> {
        return NSFetchRequest<Director>(entityName: "Director");
    }

    @NSManaged public var director_id: String?
    @NSManaged public var director_nombre: String?
    @NSManaged public var pelicula: Pelicula?

}
