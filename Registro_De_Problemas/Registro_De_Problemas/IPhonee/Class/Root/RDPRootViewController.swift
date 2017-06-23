//
//  RDPRootViewController.swift
//  Registro_De_Problemas
//
//  Created by B303-04 on 22/06/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPRootViewController: UIViewController {

    @IBOutlet weak var lblTestEmail: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let objSesion = RDPUsuarioBC.obtenerSesionUsuario()
        
        if objSesion == nil{
            
            self.performSegue(withIdentifier: "RDPLogInNavViewController", sender: nil)
            
        }else{
            
            if objSesion?.usuario_tipo == "Usuario"{
                self.performSegue(withIdentifier: "RDPUsuarioNavViewController", sender: nil)
            }else{
                self.performSegue(withIdentifier: "RDPDesarrolladorNavViewController", sender: nil)
            }
            
        }
        
    }
    
    @IBAction func clickBtnCerrar(_ sender: Any) {
        
        RDPUsuarioBC.eliminarSesionUsuario()
        self.performSegue(withIdentifier: "RDPLogInNavViewController", sender: nil)
        
        
    }
    
    
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
