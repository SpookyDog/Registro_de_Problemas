//
//  RDPUsuarioViewController.swift
//  Registro_De_Problemas
//
//  Created by B303-04 on 22/06/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPUsuarioViewController: UIViewController {

    @IBOutlet weak var lblTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblTest.text = RDPUsuarioBC.sharedInstance.objSesionUsuario?.usuario_email
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
