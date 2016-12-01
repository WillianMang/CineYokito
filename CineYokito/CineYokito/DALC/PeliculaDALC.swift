//
//  PeliculaDALC.swift
//  CineYokito
//
//  Created by B303-22 on 30/11/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit
import CoreData

class PeliculaDALC: NSObject {

    class func obtener(paraIdPelicula idPelicula : String, enArrayPeliculas arrayPeliculas : NSArray) -> Pelicula?{
        
        if arrayPeliculas.count == 0 {
            return nil
        }
        
        let predicado = NSPredicate(format: "peli_id == %@", idPelicula)
        let arrayResultado = arrayPeliculas.filtered(using: predicado)
        
        return arrayResultado.count != 0 ? arrayResultado[0] as? Pelicula : nil
    }
    
    
    
    
    @discardableResult class func agregar(pelicula objPelicula : PeliculasBE, enArrayPeliculas arrayPeliculas : NSArray,  conContexto contexto : NSManagedObjectContext) -> Pelicula{
        
        var objDM = self.obtener(paraIdPelicula: objPelicula.peli_id!, enArrayPeliculas: arrayPeliculas)
        
        if objDM == nil {
            
            objDM = NSEntityDescription.insertNewObject(forEntityName: "Pelicula", into: contexto) as? Pelicula
        }
        
        objDM!.peli_id           = objPelicula.peli_id!
        objDM!.peli_nombre       = objPelicula.peli_nombre!
        objDM!.peli_resumen      = objPelicula.peli_resumen!
        objDM!.peli_urlImagen    = objPelicula.peli_urlImagen!
        
        return objDM!
    }
    
    
    
    class func listarTodasLasPeliculas(conContexto contexto : NSManagedObjectContext) -> NSArray {
        
        let fetchRequest : NSFetchRequest<Pelicula> = Pelicula.fetchRequest()
        let sortNombre = NSSortDescriptor(key: "peli_nombre", ascending: true)
        
        fetchRequest.sortDescriptors = [sortNombre]
        
        do {
            return try contexto.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as NSArray
        }catch{
            return NSArray()
        }
    }

}
