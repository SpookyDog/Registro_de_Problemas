//
//  RDPDetalleComentarioViewController.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 7/5/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit


class RDPDetalleComentarioViewController: UIViewController {
    
    @IBOutlet weak var lblUsuario: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblComentario: UILabel!
    
    var objComentario : Comentario!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblUsuario.text        = objComentario.nombre_Usuario!
        self.lblFecha.text          = objComentario.date!
        self.lblComentario.text     = objComentario.comment!
        
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
