//
//  PeliculaTableViewCell.swift
//  CineYokito
//
//  Created by B303-22 on 19/10/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit

class PeliculaTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblPelicula: UILabel!
    @IBOutlet weak var imgPelicula: UIImageView!
    
    
    func actualizarData(){
        
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
