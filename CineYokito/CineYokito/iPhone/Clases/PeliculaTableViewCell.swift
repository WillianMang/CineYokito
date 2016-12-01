//
//  PeliculaTableViewCell.swift
//  CineYokito
//
//  Created by B303-22 on 24/11/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit

class PeliculaTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPelicula: UILabel!
    @IBOutlet weak var imgPelicula: UIImageView!
    
    
    var objPelicula : Pelicula?
    
    
    
    func actualizarData(){
        
        self.lblPelicula.text = self.objPelicula?.peli_nombre!
        
        CDMImagenDownloaded.descargaImagen(enURL: self.objPelicula!.peli_urlImagen!, paraImagenView: self.imgPelicula, conPlaceHolder: nil) { (esCorrecto, nombreImagen, image) in
            
            if self.objPelicula?.peli_urlImagen == nombreImagen {
                self.imgPelicula.image = image
            }
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
