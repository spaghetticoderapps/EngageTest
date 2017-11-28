//
//  ATM.swift
//  EngageTestApp
//
//  Created by Jeff Cedilla on 11/27/17.
//  Copyright © 2017 EngageFT. All rights reserved.
//

import Foundation

class ATM {
    
    var address: String
    var landmark: String
    var latitude: Double
    var longitude: Double
    var postalCode: String
    
    init(address: String,
         landmark: String,
         latitude: Double,
         longitude: Double,
         postalCode: String)
    {
        self.address = address
        self.landmark = landmark
        self.latitude = latitude
        self.longitude = longitude
        self.postalCode = postalCode
    }
    
}
