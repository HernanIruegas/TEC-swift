//
//  ViewControllerOperacion.swift
//  Parcial1V1E18
//
//  Created by Alumno on 2/15/18.
//  Copyright © 2018 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerOperacion: UIViewController {
    
    /* PROBLEMA 4 */
    
    @IBOutlet weak var lbTipoOperacion: UILabel!
    @IBOutlet weak var lbResultado: UILabel!
    
    var tipoOperacion : String = ""
    var resultado : Int = 0
    
    /* PROBLEMA 6 */
    
    @IBOutlet weak var tfMensaje: UITextField!
    @IBOutlet weak var btRegresar: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender as! UIButton == btRegresar{
            
            let vistaInicio = segue.destination as! ViewController
            vistaInicio.mensaje = tfMensaje.text!
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if sender as! UIButton == btRegresar{
            if tfMensaje.text! == "" {
                let alerta = UIAlertController(title: "Error", message: "Ingresa datos en el campo de Mensaje", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(alerta, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /* PROBLEMA 4 */
        
        lbTipoOperacion.text = tipoOperacion
        lbResultado.text = String(resultado)
        
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
