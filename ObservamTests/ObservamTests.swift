//
//  ObservamTests.swift
//  ObservamTests
//
//  Created by Mathieu Godart on 13/01/2017.
//  Copyright © 2017 Godart. All rights reserved.
//

import XCTest
//import Foundation
//import Pods_Observam
@testable import Observam



let testString1 = "Test string 1"
let testString2 = "Test string 2"
let testDate1 = Date()
let testDate2 = Date(timeIntervalSinceNow: -60)
let testDate3 = Date(timeIntervalSinceNow: -60*60*24*3)



class ObservamTests: XCTestCase {
    


    override func setUp() {
        super.setUp()
    }



    override func tearDown() {
        super.tearDown()
    }



    func testInit() {
        let care = Care(title: testString1, date: testDate1)
        XCTAssert(care.title == testString1)
        XCTAssert(care.date == testDate1)
    }



    func testGrouping() {
        CareHistory.add(testString2, atDate: testDate3)
        CareHistory.add(testString1, atDate: testDate3)
        CareHistory.add(testString1, atDate: testDate1)
        CareHistory.add(testString1, atDate: testDate2)

        print(testDate1.description(with: Locale.current))
        print(testDate1.description(with: Locale.current))
//        print(testDate1.dateAtStartOfDay().description(with: Locale.current))
        //        let region = Region(timeZoneName: TimeZoneName.EuropeParis)
        //        print(testDate1.startOf(.Day, inRegion: region))

        let groupedCares = CareHistory.caresGroupedByDay()
        print(groupedCares)
    }


    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
