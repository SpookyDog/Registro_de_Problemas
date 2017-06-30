//
//  RDPTicketDALC.swift
//  Registro_De_Problemas
//
//  Created by B303-04 on 29/06/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit
import CoreData

class RDPTicketDALC: NSObject {
    
    class func listarTicketsConContext(_ context : NSManagedObjectContext) -> [Ticket]{
        
        let fetchRequest : NSFetchRequest<Ticket> = Ticket.fetchRequest()
        
        do{
            return try context.fetch(fetchRequest)
        }catch{
            return [Ticket]()
        }
        
    }
    
    class func listarTicketsPorUsuario(_ usuario : String, conContext context : NSManagedObjectContext) -> [Ticket]{
        
        let fetchRequest : NSFetchRequest<Ticket> = Ticket.fetchRequest()
        
        do{
         
            let predicate = NSPredicate(format: "nombre_Usuario == %@", usuario)
            
            fetchRequest.predicate = predicate
            
            return try context.fetch(fetchRequest)
        }catch{
            return [Ticket]()
        }
        
    }
    
    @discardableResult class func agregar(_ objTicket : RDPTicketBE, conContext context : NSManagedObjectContext) -> Ticket{
        
        let objDM = NSEntityDescription.insertNewObject(forEntityName: "Ticket", into: context) as! Ticket
        
        objDM.nombre_Usuario    = objTicket.nombre_Usuario
        objDM.title             = objTicket.titulo
        objDM.estado            = objTicket.estado
        objDM.descripcion       = objTicket.descripcion
        
        return objDM
    }

}
