//
//  GoldenFleeceTests.swift
//  GoldenFleeceTests
//
//  Created by Alexander Schuch on 03/04/15.
//  Copyright (c) 2015 Alexander Schuch. All rights reserved.
//

import UIKit
import XCTest
import Argo
import GoldenFleece
import CoreLocation

class GoldenFleeceTests: XCTestCase {

    func testNSURL() {
        let urlString = "http://example.com"
        let json = ["url": urlString]
        let j = JSON.parse(json)
        
        let url: Decoded<NSURL> = j <| "url"
        XCTAssertNotNil(url.value, "url is nil")
        XCTAssertEqual(url.value!.absoluteString!, urlString, "url output != url input")
    }
    
    func testCLLocation() {
        let lat = 11.44384
        let lon = 22.55897
        
        let jsons = [
            [ "location": [ "lat": lat, "lon": lon ] ],
            //[ "location": [ "latitude": lat, "longitude": lon ] ],
            //[ "location": [ lat, lon ] ]
        ]
        
        for json in jsons {
            let j = JSON.parse(json)
            
            let location: Decoded<CLLocation> = j <| "location"
            XCTAssertNotNil(location.value, "location is nil")
            XCTAssertEqual(location.value!.coordinate.latitude, lat, "lat output != lat input")
            XCTAssertEqual(location.value!.coordinate.longitude, lon, "lon output != lon input")
        }
        
    }
    
}
