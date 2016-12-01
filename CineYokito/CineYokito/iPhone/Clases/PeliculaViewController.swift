//
//  PeliculaViewController.swift
//  CineYokito
//
//  Created by B303-22 on 24/11/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit

class PeliculaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblPelicula: UITableView?
    
    var arrayPeliculas = NSMutableArray()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayPeliculas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PeliculaTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PeliculaTableViewCell
        cell.objPelicula = self.arrayPeliculas[indexPath.row] as? Pelicula
        cell.actualizarData()
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PeliculasBC.listarPeliculas { (arrayPeliculas) in
            
            self.arrayPeliculas = arrayPeliculas
            self.tblPelicula?.reloadData()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
    
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
