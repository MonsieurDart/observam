//
//  ModelTests.swift
//  Observam
//
//  Created by Mathieu Godart on 21/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

import XCTest
//import SwiftDate
//import SwiftDate.Swift
//import CareModel
//import CareHistory



let testString1 = "Test string 1"
let testString2 = "Test string 2"
let testDate1 = Date()
let testDate2 = Date(timeIntervalSinceNow: -60)
let testDate3 = Date(timeIntervalSinceNow: -60*60*24*3)



class ModelTests: XCTestCase {



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

        XCTAssert(testDate1.isInSameDayAsDate(testDate2))
        XCTAssert(!testDate1.isInSameDayAsDate(testDate3))
    }


    
    func testGrouping() {
        CareHistory.add(testString2, atDate: testDate3)
        CareHistory.add(testString1, atDate: testDate3)
        CareHistory.add(testString1, atDate: testDate1)
        CareHistory.add(testString1, atDate: testDate2)

        print(testDate1.description(with: Locale.current))
        print(testDate1.description(with: Locale.current))
        print(testDate1.dateAtStartOfDay().description(with: Locale.current))
//        let region = Region(timeZoneName: TimeZoneName.EuropeParis)
//        print(testDate1.startOf(.Day, inRegion: region))

        let groupedCares = CareHistory.caresGroupedByDay()
        print(groupedCares)
    }



//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }



}


