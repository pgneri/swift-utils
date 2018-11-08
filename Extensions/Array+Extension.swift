//
//  Array+Extension.swift
//  Utils
//
//  Copyright © 2018 pgneri. All rights reserved.
//

import Foundation

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
