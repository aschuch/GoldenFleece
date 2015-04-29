//
//  CLLocation+Argo.swift
//  Example
//
//  Created by Alexander Schuch on 03/04/15.
//  Copyright (c) 2015 Alexander Schuch. All rights reserved.
//

import CoreLocation
import Argo
import Runes

extension CLLocation: Decodable {
    public typealias DecodedType = CLLocation
    
    public class func decode(j: JSON) -> Decoded<CLLocation> {
        switch j {
        case .Object(let dict):
            switch (dict["lat"], dict["lon"]) {
            case (.Some(.Number(let lat)), .Some(.Number(let lon))):
                let location = CLLocation(latitude: lat.doubleValue, longitude: lon.doubleValue)
                return pure(location)
            default:
                return .MissingKey("`lat` and/or `lon` not found")
            }
        default:
            return .TypeMismatch("\(j) could not be decoded to CLLocation")
        }
    }
}
