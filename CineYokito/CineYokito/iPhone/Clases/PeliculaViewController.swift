//
//  PeliculaViewController.swift
//  CineYokito
//
//  Created by B303-22 on 19/10/16.
//  Copyright © 2016 B303-22. All rights reserved.
//

import UIKit

class PeliculaViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tblPeliculas: UITableView!

    var arrayPeliculas = NSMutableArray()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return self.arrayPeliculas.count
    
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
