//
//  CDMImagenDownloaded.swift
//  CineYokito
//
//  Created by B303-22 on 2/11/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit

class CDMImagenDownloaded: NSObject {

    static let CDMImageDownloadedDirectorioDescarga = "Caches"
    
    class func guardar(imagen aImagen: UIImage?, conNombre nombre: String?, enDirectorio directorio : String?) ->Bool{
        
        if aImagen == nil || nombre == nil{
            
            return false
        
        }
        
        let documentsPath   = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] as NSString
        let cachesPath      = documentsPath.appendingPathComponent(directorio != nil ? directorio! : self.CDMImageDownloadedDirectorioDescarga) as NSString
        let filePath        = cachesPath.appendingPathComponent(nombre!)
        let data            = nombre?.hasSuffix("jpg") == true ? UIImagePNGRepresentation(aImagen!) : UIImagePNGRepresentation(aImagen!)
        
        do{
            try data?.write(to: URL.init(fileURLWithPath: filePath), options: Data.WritingOptions.atomic)
            print("OSPImageDownLoad / Se guardó la imagen \(nombre!)")
            
            return true
            
        } catch {
            
            print("OSPImagenDownload / No se guardó la imagen \(nombre!)")
            
            return false
        }
    }
    
    class func obtenerImagen(conNombre nombre: String?, enDirectorio directorio: String?) -> UIImage? {
        
        if nombre == nil {
            
            return nil
        }
        
        var imagen : UIImage?
        
        let fileManager     = FileManager.default
        let documentsPath   = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true) [0] as NSString
        let cachesPath      = documentsPath.appendingPathComponent(directorio != nil ? directorio! : self.CDMImageDownloadedDirectorioDescarga) as NSString
        let filePath        = cachesPath.appendingPathComponent(nombre!)
        
        if fileManager.fileExists(atPath: filePath){
            
            imagen = UIImage(contentsOfFile: filePath)
            
        }
        
        return imagen
    }
    
    class func descargarImagen(enURL url : String?, conNombre nombre : String?) -> UIImage? {
        
        if url == nil || nombre == nil {
            
            return nil
        }
        
        let urlDescarga = URL.init(string: url!)
        
        if urlDescarga == nil {
            
            return nil
        }
        
        do {
            let dataImagenDescarga = try Data.init(contentsOf: urlDescarga!)
            let imgDescarga = UIImage(data: dataImagenDescarga)
            
            return self.guardar(imagen: imgDescarga, conNombre: nombre, enDirectorio: nil) == true ? self.obtenerImagen(conNombre: nombre, enDirectorio: nil) : nil
            
        } catch {
            
            return nil
            
        }
        
    }
    
    class func asignarConAnimacion(laImagen nuevaImagen : UIImage?, enImagen imagenView : UIImageView, conTransicion transicion : String?) {
        
        imagenView.image = nuevaImagen
        
        let transition = CATransition.init()
        transition.duration = 0.35
        transition.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = transicion != nil ? transicion! : kCATransitionFade
        
        imagenView.layer.add(transition, forKey: nil)
    }
    
    class func descargaImagen(enURL url : String?, paraImagenView imagenViewFoto : UIImageView, conPlaceHolder imgPlaceHolder : UIImage?, conCompletion completion : @escaping(_ descargaCorrecta : Bool, _ nombreArchivo: String?, _ imagen : UIImage?) -> Void) {
        
        imagenViewFoto.image = imgPlaceHolder
        
        var nombre : String? = url == nil ? nil : NSString(string: url!).lastPathComponent
        
        nombre = nombre?.hasSuffix("jpg") == true ? nombre?.replacingOccurrences(of: ".jpg", with: "@2x.jpg") : nombre?.replacingOccurrences(of: ".png", with: "@2x.png")
        
        DispatchQueue.global(qos: .default).async {
            
            let imagenGuardada = self.obtenerImagen(conNombre: nombre, enDirectorio: nil)
            
            if imagenGuardada == nil {
                
                let imagenDescargada = self.descargarImagen(enURL: url, conNombre: nombre)
                DispatchQueue.main.async {
                    
                    completion( imagenDescargada != nil ? true : false, url, imagenDescargada != nil ? imagenDescargada : imgPlaceHolder)
                    
                }
                
            } else {
                
                DispatchQueue.main.async {
                
                    completion( true, url, imagenGuardada)
                }
            }
        }
    }
    
    
}
