//
//  PeliculaViewController.swift
//  CineYokito
//
//  Created by B303-22 on 24/11/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit

class PeliculaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{

    @IBOutlet weak var tblPelicula: UITableView?
    @IBOutlet weak var searchBar: UISearchBar!
    
    var arrayPeliculas = NSMutableArray()
    var arrayPeliculaTabla = NSMutableArray()
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        if searchText.characters.count == 0 {
            
            self.arrayPeliculaTabla = self.arrayPeliculas
        }else{
            
            let predicado = NSPredicate(format: "nombre CONTAINS[c] %@", searchText)
            let arrayResultado = NSMutableArray(array: self.arrayPeliculas.filtered(using: predicado))
            self.arrayPeliculaTabla =  arrayResultado
        }
        
        self.tblPelicula?.reloadData()

    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayPeliculaTabla.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PeliculaTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PeliculaTableViewCell
        cell.objPelicula = self.arrayPeliculaTabla[indexPath.row] as? Pelicula
        cell.actualizarData()
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "DetallePeliculaViewController", sender: self.arrayPeliculaTabla[indexPath.row])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PeliculasBC.listarPeliculas { (arrayPeliculas) in
            
            self.arrayPeliculas = arrayPeliculas
            self.arrayPeliculaTabla = arrayPeliculas
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
