//
//  NSURLJSONExtension.swift
//  Example
//
//  Created by Alexander Schuch on 03/04/15.
//  Copyright (c) 2015 Alexander Schuch. All rights reserved.
//

import UIKit
import Argo

extension NSURL: Decodable {
    public typealias DecodedType = NSURL
    
    public class func decode(j: JSON) -> Decoded<NSURL> {
        switch j {
        case .String(let url):
            return NSURL(string: url).map(pure) ?? .TypeMismatch("`\(url)` could not be decoded to NSURL")
        default:
            return .TypeMismatch("\(j) could not be decoded to NSURL")
        }
    }
}
