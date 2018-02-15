//
//  ViewController.swift
//  Parcial1V1E18
//
//  Created by Yolanda Martinez on 2/12/18.
//  Copyright © 2018 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*  PROBLEMA 1 */
    
    @IBOutlet weak var lbLetrero: UILabel!
    
    @IBAction func changeColorLabel(_ sender: Any) {
        
        if( lbLetrero.textColor == UIColor.red ){
            lbLetrero.textColor = UIColor.blue
        }else{
            lbLetrero.textColor = UIColor.red
        }
    }
    
    /*  PROBLEMA 2 */
    
    @IBOutlet weak var squareColor1: UIView!
    @IBOutlet weak var squareColor2: UIView!
    @IBOutlet weak var squareColor3: UIView!
    @IBOutlet weak var squareColor4: UIView!
    var squareColorCollection: [UIView] = []
    var colorCounter = 0;
    
    @IBAction func addBlueColor(_ sender: Any) {
        
        if( colorCounter > 3){
            colorCounter = 3
            squareColorCollection[colorCounter].backgroundColor = UIColor.blue
        }else{
            if( colorCounter < 0){
                colorCounter = 0
                squareColorCollection[colorCounter].backgroundColor = UIColor.blue
                colorCounter += 1
            }else{
                squareColorCollection[colorCounter].backgroundColor = UIColor.blue
                colorCounter += 1
            }
        }
        
        
        
        
        /*
        if( colorCounter  <= 3 && colorCounter >= 0 ){
            squareColorCollection[colorCounter].backgroundColor = UIColor.blue
            colorCounter += 1
        }else{
            if( colorCounter > 3){
                colorCounter = 3
            }
        }*/
        
    }
    
    @IBAction func removeBlueColor(_ sender: Any) {

        if( colorCounter > 3){
            colorCounter = 3
            squareColorCollection[colorCounter].backgroundColor = UIColor.white
            colorCounter -= 1
        }else{
            if( colorCounter < 0){
                colorCounter = 0
                squareColorCollection[colorCounter].backgroundColor = UIColor.white
            }else{
                squareColorCollection[colorCounter].backgroundColor = UIColor.white
                colorCounter -= 1
            }
        }
        
        /*if( colorCounter  <= 3 && colorCounter >= 0 ){
            squareColorCollection[colorCounter].backgroundColor = UIColor.white
            colorCounter -= 1
        }else{
            if( colorCounter < 0){
                colorCounter = 0
            }
        }*/
    }
    
    
    /* PROBLEMA 3 */
    
    @IBOutlet weak var switchHideShow: UISwitch!
    @IBOutlet weak var yellowView: UIView!
    
    @IBAction func hideOrShowView(_ sender: Any) {
        
        if(switchHideShow.isOn){
            yellowView.isHidden = false
        }else{
            yellowView.isHidden = true
        }
    }
    
    /* PROBLEMA 4 */
    
    @IBOutlet weak var sgTypeOperation: UISegmentedControl!
    @IBOutlet weak var tfNumber: UITextField!
    var result = 0
    var operacion = ""
    
    @IBAction func btCalculate(_ sender: Any) {
        
        switch sgTypeOperation.selectedSegmentIndex{
            case 0:
                operacion = "cuadrado"
                result = Int(tfNumber.text!)! * Int(tfNumber.text!)!
            case 1:
                operacion = "cubo"
                result = Int(tfNumber.text!)! * Int(tfNumber.text!)! * Int(tfNumber.text!)!
            default:
                break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let viewOperacionInfo = segue.destination as! ViewControllerOperacion
        
        viewOperacionInfo.tipoOperacion = operacion
        viewOperacionInfo.resultado = result
    
    }
    
  
    
    /* PROBLEMA 6 */
    
    @IBOutlet weak var lbMensaje: UILabel!
    var mensaje : String = ""
    
    @IBAction func unwindViewOperacion(unwindSegue : UIStoryboardSegue){
        
       lbMensaje.text = mensaje
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /* PROBLEMA 5 */
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)

        
        /*  PROBLEMA 2 */
        
        // Set up array of UIViews for pins
        squareColorCollection.append(squareColor1)
        squareColorCollection.append(squareColor2)
        squareColorCollection.append(squareColor3)
        squareColorCollection.append(squareColor4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /* PROBLEMA 5 */
    
    @objc func quitaTeclado() {
        view.endEditing(true)
    }
    
}

