//
//  Sincronizar.swift
//  CineYokito
//
//  Created by B303-22 on 30/11/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit

class Sincronizar: NSObject {

    class func iniciarSincronizacion(conCompletion completion : @escaping () -> Void){
        
        CDMWebModel.obtenerInformacion { (arrayPeliculas, arraySucursales, arrayHorarios) in
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let contexto = appDelegate.persistentContainer.viewContext
            
            var arrayPeliculasDM = PeliculaDALC.listarTodasLasPeliculas(conContexto: contexto)
            arrayPeliculas.enumerateObjects({ (obj, idx, stop) in
                PeliculaDALC.agregar(pelicula: obj as! PeliculasBE, enArrayPeliculas: arrayPeliculasDM, conContexto: contexto)
            })
            
            var arraySucursalesDM = SucursalDALC.listarTodasLasSucursales(conContexto: contexto)
            arraySucursales.enumerateObjects({ (obj, idx, stop) in
                SucursalDALC.agregar(sucursales: obj as! SucursalBE, enArraySucursales: arraySucursalesDM, conContexto: contexto)
            })
            
            
            arrayPeliculasDM = PeliculaDALC.listarTodasLasPeliculas(conContexto: contexto)
            arraySucursalesDM = SucursalDALC.listarTodasLasSucursales(conContexto: contexto)
            let arrayHorariosDM = HorarioDALC.listarTodasLosHorarios(conContexto: contexto)
            
            arrayHorarios.enumerateObjects({ (obj, idx, stop) in
                
                HorarioDALC.agregar(horario: obj as! HorarioBE, conArrayPeliculas: arrayPeliculasDM, conArraySucursales: arraySucursalesDM, enArrayHorario: arrayHorariosDM, conContexto: contexto)
            })
            
            appDelegate.saveContext()
            
            completion()
            
        }
    }

}
