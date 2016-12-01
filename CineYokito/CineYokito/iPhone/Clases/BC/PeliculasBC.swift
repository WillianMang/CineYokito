//
//  PeliculasBC.swift
//  CineYokito
//
//  Created by B303-22 on 19/10/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit

class PeliculasBC: NSObject {

    class func listarPeliculas(conCompletion completion : @escaping(_ arrayPeliculas : NSMutableArray) -> Void) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let arrayPeliculas = NSMutableArray(array: PeliculaDALC.listarTodasLasPeliculas(conContexto: appDelegate.persistentContainer.viewContext))
        completion(arrayPeliculas.count == 0 ? NSMutableArray() : arrayPeliculas)
    }
}
