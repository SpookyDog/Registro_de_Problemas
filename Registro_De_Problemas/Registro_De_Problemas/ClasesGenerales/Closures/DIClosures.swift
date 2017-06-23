//
//  DIClosures.swift
//  DemoServicios
//
//  Created by B303-04 on 8/06/17.
//  Copyright © 2017 B303-24. All rights reserved.
//

import UIKit
import CoreData


class DIClosures: NSObject {

    typealias MensajeError                     = (_ mensajeError : String) -> Void
    typealias MensajeErrorStatus               = (_ mensajeError : String, _ expiroSesion : Bool) -> Void
    typealias Login                            = (_ usuario : RDPUsuarioBE) -> Void
    typealias Correct                          = (_ objUsuarioDM : Usuario?) -> Void
}
