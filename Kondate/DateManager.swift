//
//  DateManager.swift
//  Kondate
//
//  Created by 藤井陽介 on 2016/11/09.
//  Copyright © 2016年 ryusei wakasa. All rights reserved.
//



import Foundation
import UIKit

extension Date {
    func monthAgoDate() -> Date {
        let addValue = -1
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return calendar.date(byAdding: dateComponents, to: self)!
        // return calendar.dateByAddingComponents(dateComponents, toDate: self, options: Calendar.Options(rawValue: 0))!
    }
    
    func monthLaterDate() -> Date {
        let addValue: Int = 1
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return calendar.date(byAdding: dateComponents, to: self)!
        // return calendar.dateByAddingComponents(dateComponents, toDate: self, options: Calendar.Options(rawValue: 0))!
    }
    
}

class DateManager {
    var currentMonthOfDates = [Date]()
    var selectedDate = Date()
    let daysPerWeek: Int = 7
    var numberOfItems: Int!
    
    func daysAcquisition() -> Int {
        let rageOfWeeks = Calendar.current.range(of: .weekOfMonth, in: .month, for: firstDateOfMonth())
        // let rangeOfWeeks = Calendar.currentCalendar.rangeOfUnit(Calendar.Unit.WeekOfMonth, inUnit: Calendar.Unit.Month, forDate: firstDateOfMonth())
        let numberOfWeeks = rageOfWeeks?.count
        numberOfItems = numberOfWeeks! * daysPerWeek
        return numberOfItems
        
    }
    
    func firstDateOfMonth() -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: selectedDate)
        // let components = Calendar.currentCalendar.components([.Year, .Month, .Day], fromDate: selectedDate)
        components.day = 1
        let firstDateMonth = Calendar.current.date(from: components)
        // let firstDateMonth = Calendar.currentCalendar().dateFromComponents(components)!
        return firstDateMonth!
    }
    func dateForCellAtIndexPath(_ numberOfItems: Int) {
        let ordinalityOfFirstDay = Calendar.current.ordinality(of: .day, in: .weekOfMonth, for: firstDateOfMonth())!
        // let ordinalityOfFirstDay = Calendar.currentCalendar.ordinalityOfUnit(Calendar.Unit.Day, inUnit: Calendar.Unit.WeekOfMonth, forDate: firstDateOfMonth())
        for i in 0 ..< numberOfItems {
            var dateComponents = DateComponents()
            dateComponents.day = i - (ordinalityOfFirstDay - 1)
            let date = Calendar.current.date(byAdding: dateComponents, to: firstDateOfMonth())!
            // let date = Calendar.currentCalendar.dateByAddingComponents(dateComponents, toDate: firstDateOfMonth(), options: Calendar.Options(rawValue: 0))!
            currentMonthOfDates.append(date)
        }
    }
    
    // ⑵表記の変更
    func conversionDateFormat(_ indexPath: IndexPath) -> String {
        dateForCellAtIndexPath(numberOfItems)
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: currentMonthOfDates[indexPath.row] as Date)
    }
    
    func conversionDate(_ indexPath: IndexPath) -> Date {
        dateForCellAtIndexPath(numberOfItems)
        return currentMonthOfDates[indexPath.row]
    }
    
    func prevMonth(_ date: Date) -> Date {
        currentMonthOfDates = []
        selectedDate = date.monthAgoDate()
        return selectedDate
    }
    //次月の表示
    func nextMonth(_ date: Date) -> Date {
        currentMonthOfDates = []
        selectedDate = date.monthLaterDate()
        return selectedDate
    }

}
