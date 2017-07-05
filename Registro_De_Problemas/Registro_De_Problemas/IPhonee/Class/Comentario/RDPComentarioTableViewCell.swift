//
//  RDPComentarioTableViewCell.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 7/5/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPComentarioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblUsuario: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    
    var objComentario : Comentario!
    
    func actualizarData(){
        let str = self.objComentario.comment
        let index = str!.index(str!.startIndex, offsetBy: 10)
        self.lblUsuario.text = self.objComentario.nombre_Usuario!
        self.lblComment.text = "\(str!.substring(to: index))..."
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
