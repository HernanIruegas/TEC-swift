//
//  TableViewControllerEmpleados.swift
//  segundoParcial
//
//  Created by Alumno on 3/22/18.
//  Copyright © 2018 R.Duran. All rights reserved.
//

import UIKit

class TableViewControllerEmpleados: UITableViewController, protocoloModificaSueldo {
   
    var arrDiccionarios : NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        
        arrDiccionarios = NSMutableArray(contentsOfFile: path!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDiccionarios.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let dic = arrDiccionarios[indexPath.row] as!NSDictionary
        
        cell.textLabel?.text = dic.object(forKey: "ident") as! String
        cell.detailTextLabel?.text = dic.object(forKey: "nombre") as! String
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        let viewEditar = segue.destination as! ViewControllerEmpleados
        
        let indexPath = tableView.indexPathForSelectedRow
        
        let dic = arrDiccionarios[(indexPath?.row)!] as!NSDictionary
        
        viewEditar.ident = dic.object(forKey: "ident") as! String
        viewEditar.nombre = dic.object(forKey: "nombre") as! String
        
        let aux = dic.object(forKey: "sueldo") as! String
        
        viewEditar.sueldo = aux
        viewEditar.indexTable = (indexPath?.row)!
        viewEditar.delegado = self
        
    }
    
    // MARK: Metodo de protocolo
    func modSueldo(sueldo: Int, indice: Int) {
        (arrDiccionarios[indice] as AnyObject).setValue(sueldo, forKey: "sueldo")   //[indice].sueldo = sueldo
        tableView.reloadData()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
