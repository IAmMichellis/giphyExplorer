//
//  JSONDecoder+context.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-07.
//

import Foundation
import CoreData

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")!
}

extension JSONDecoder {
    convenience init(context: NSManagedObjectContext) {
        self.init()
        self.userInfo[.context] = context
    }
}
