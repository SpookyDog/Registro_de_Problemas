//
//  RDPUserTicketTableViewCell.swift
//  Registro_De_Problemas
//
//  Created by B303-04 on 29/06/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPUserTicketTableViewCell: UITableViewCell {
    
    var objTicket : Ticket!
    
    @IBOutlet weak var lblTitle: UILabel!

    func actualizarData(){
        
        self.lblTitle.text = "\(self.objTicket.nombre_Usuario!) -- \(self.objTicket.title!)"
        
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
