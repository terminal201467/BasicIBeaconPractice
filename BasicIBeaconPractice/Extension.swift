//
//  Extension.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/26.
//

import Foundation

extension Array where Element: Hashable {
  func removingDuplicates() -> [Element] {
      var addedDict = [Element: Bool]()
      return filter {
        addedDict.updateValue(true, forKey: $0) == nil
      }
   }
   mutating func removeDuplicates() {
      self = self.removingDuplicates()
   }
}
