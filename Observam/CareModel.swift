//
//  CareModel.swift
//  Observam
//
//  Created by Mathieu Godart on 21/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

import Foundation
import SwiftDate
import AFDateHelper



// TODO: This should be moved elsewhere…
func globalTintColor() -> UIColor {
    return UIColor(red:31.0/255, green:187.0/255, blue:151.0/255, alpha:1);
}

// TODO: Move this…
var globalIsWizardCompleted = false

var globalDrugAlreadyTaken = false



struct Care {

    var date: NSDate = NSDate()
    var title: String = "Sans effet."

    init(title: String)  {
        self.title = title
    }

    init(title: String, date: NSDate)  {
        self.title = title
        self.date = date
    }
}



class CareHistory {

    static var cares = Array<Care>()

    static func count() -> Int {
        return cares.count
    }

    static func add(title: String) {
        cares.append(Care(title: title))
    }

    static func add(title: String, atDate: NSDate) {
        cares.append(Care(title: title, date: atDate))
    }

    static func caresGroupedByDay() -> [[Care]] {

        return cares
            .groupBy { $0.date.dateAtStartOfDay() }
            .sort { $0.0 > $1.0 }
            .map { (date, cares) in cares.sort { $0.date > $1.date } }

//        return [[Care(title: "test"), Care(title: "test 2")]]

//        let uniqDates = cares
//            .map { care -> NSDate in
//                return care.date.dateAtStartOfDay()
//        }
//        .sort()
//        .reduce(Array<NSDate>()) { (var uniqDates, date) -> Array<NSDate> in
//            if (uniqDates.last != date) { uniqDates.append(date) }
//            return uniqDates;
//        }
//
//        var groupedCares = Dictionary<NSDate, Array<Care>>()
//
//        uniqDates
//            .forEach { groupDate in
//
//                let caresForDate = cares
//                    .filter { care -> Bool in
//                        return care.date.dateAtStartOfDay() == groupDate
//                }
//                groupedCares[groupDate] = caresForDate
//        }
//
//        return groupedCares
//        return cares
//            .sort { careA, careB -> Bool in
//                return careA.date.compare(careB.date) == .OrderedDescending
//            }
//            .map { care -> Dictionary<NSDate, Care> in
//                return [care.date : care]
//        }

//    NSArray *allDates = careHistory.allKeys;
//
//    if (groupId >= allDates.count) return nil;
//
//    NSArray *sortedDates =
//    [allDates sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
//    {
//    return [obj2 compare:obj1];
//    }];
//
//    NSDate *careDateForGroupId = sortedDates[groupId];
//    NSArray *caresForDate = [careHistory objectForKey:careDateForGroupId];
//
//    NSArray *sortedCaresForDate =
//    [caresForDate sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
//    {
//    return [obj2[kDate] compare:obj1[kDate]];
//    }];
//
//    return sortedCaresForDate;
    }
}



extension Array {

    func groupBy<G: Hashable>(groupClosure: (Element) -> G) -> [G: [Element]] {
        var dictionary = [G: [Element]]()

        for element in self {
            let key = groupClosure(element)
            var array: [Element]? = dictionary[key]

            if (array == nil) {
                array = [Element]()
            }

            array!.append(element)
            dictionary[key] = array!
        }

        return dictionary
    }
}







