//
//  RDPTicketTableViewCell.swift
//  Registro_De_Problemas
//
//  Created by B303-04 on 29/06/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPTicketTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitulo: UILabel!
    
    var objTicket : Ticket!
    
    
    func actualizarData(){
        
        self.lblTitulo.text = "\(self.objTicket.nombre_Usuario) -- \(self.objTicket.title)"
        
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
