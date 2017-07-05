//
//  RDPTicketBC.swift
//  Registro_De_Problemas
//
//  Created by B303-04 on 29/06/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit
import CoreData

class RDPTicketBC: NSObject {
    
    typealias Agregar = (_ objTicket : Ticket) -> Void
    typealias MensajeError = (_ mensaje : String) -> Void
    
    class func listarTicketsConContext() -> [Ticket]{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return RDPTicketDALC.listarTicketsConContext(appDelegate.persistentContainer.viewContext)
    }
    
    class func listarTicketsPorUsuario(_ usuario : String) -> [Ticket]{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return RDPTicketDALC.listarTicketsPorUsuario(usuario, conContext: appDelegate.persistentContainer.viewContext)
    }
    
    class func agregar(_ objTicket : RDPTicketBE, conCorrecto correct : Agregar, conError error : MensajeError){
        
        if objTicket.descripcion?.characters.count == 0 || objTicket.descripcion == nil {
            error("Ingresa la descripcion de la ticket!")
            return
        }
        
        if objTicket.titulo?.characters.count == 0 || objTicket.descripcion == nil {
            error("Ingresa el titulo de la ticket!")
            return
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let objDM = RDPTicketDALC.agregar(objTicket, conContext: appDelegate.persistentContainer.viewContext)
        
        appDelegate.saveContext()
        
        correct(objDM)
    }

}
