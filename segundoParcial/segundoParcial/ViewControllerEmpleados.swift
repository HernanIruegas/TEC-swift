//
//  ViewControllerEmpleados.swift
//  segundoParcial
//
//  Created by Alumno on 3/22/18.
//  Copyright © 2018 R.Duran. All rights reserved.
//

import UIKit

protocol protocoloModificaSueldo{
    
    func modSueldo(sueldo: Int, indice: Int) -> Void
    
}

class ViewControllerEmpleados: UIViewController {
    
    @IBOutlet weak var lbIdent: UILabel!
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var tfSueldo: UITextField!
    
    var ident : String = ""
    var nombre : String = ""
    var sueldo : String = ""
    var indexTable : Int = 0
    
    var delegado : protocoloModificaSueldo!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lbIdent.text = ident
        lbNombre.text = nombre
        tfSueldo.text = sueldo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func guardar(_ sender: Any) {
        delegado.modSueldo(sueldo: Int(tfSueldo.text!)!, indice: indexTable)
        navigationController?.popToRootViewController(animated: true)
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
