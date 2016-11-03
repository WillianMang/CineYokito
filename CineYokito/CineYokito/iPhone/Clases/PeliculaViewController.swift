//
//  PeliculaViewController.swift
//  CineYokito
//
//  Created by B303-22 on 19/10/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit

class PeliculaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblPeliculas: UITableView!

    var arrayPelicula = NSMutableArray()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPelicula.count
    }
    
    func tableView(_ tanbleView : UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PeliculaTableViewCEll"
        
        let cell = tanbleView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PeliculaTableViewCell
        cell.objPelicula = self.arrayPelicula[indexPath.row] as? Pelicula
        cell.actualizarData()
        
        return cell
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        PeliculasBC.listarPelicula{ (arrayPelicula) in
            self.arrayPelicula = arrayPelicula
            self.tblPeliculas.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
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
