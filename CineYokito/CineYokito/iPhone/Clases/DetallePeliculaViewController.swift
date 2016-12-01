//
//  DetallePeliculaViewController.swift
//  CineYokito
//
//  Created by B303-22 on 24/10/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit

class DetallePeliculaViewController: UIViewController {

    
    @IBOutlet weak var imgPelicula: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblResumen: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    
    var arrayPelicula: NSMutableArray?
    var objPelicula = PeliculasBE()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CDMImagenDownloaded.descargaImagen(enURL: self.objPelicula.peli_urlImagen, paraImagenView: self.imgPelicula, conPlaceHolder: nil) { (esCorrecto, nombreImagen, image) in
            
            self.imgPelicula.image = image
        }
        
        self.lblNombre.text = self.objPelicula.peli_nombre!
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}
