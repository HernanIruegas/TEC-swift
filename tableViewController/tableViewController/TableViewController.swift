//
//  TableViewController.swift
//  tableViewController
//
//  Created by Hernán Iruegas Villarreal on 12/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var listaJugadores = [jugador]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var player = jugador(nombre: "David", puntos: 80, email: "d@hotmail.com")
        listaJugadores.append(player)
        
        player = jugador(nombre: "eduardo", puntos: 82, email: "e@hotmail.com")
        listaJugadores.append(player)
        
        player = jugador(nombre: "hal", puntos: 75, email: "h@hotmailc.com")
        listaJugadores.append(player)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaJugadores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = listaJugadores[indexPath.row].nombre
        cell.detailTextLabel?.text = String(listaJugadores[indexPath.row].puntos)
        cell.imageView?.image = #imageLiteral(resourceName: "user")

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let viewPrincipal = segue.destination as! ViewController
        
        let indexPath = tableView.indexPathForSelectedRow
        
        viewPrincipal.nombre = listaJugadores[(indexPath?.row)!].nombre
        viewPrincipal.puntos = listaJugadores[(indexPath?.row)!].puntos
        viewPrincipal.email = listaJugadores[(indexPath?.row)!].email
        
        
        
    }
    

}
