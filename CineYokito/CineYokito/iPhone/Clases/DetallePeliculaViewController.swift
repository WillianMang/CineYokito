//
//  DetallePeliculaViewController.swift
//  CineYokito
//
//  Created by B303-22 on 24/10/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit

class DetallePeliculaViewController: UIViewController {

    @IBOutlet weak var imgImagen: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblResumen: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
