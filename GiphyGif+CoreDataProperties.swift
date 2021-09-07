//
//  GiphyGif+CoreDataProperties.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-07.
//
//

import Foundation
import CoreData


extension GiphyGif {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GiphyGif> {
        return NSFetchRequest<GiphyGif>(entityName: "GiphyGif")
    }

    @NSManaged public var largeUrl: String?
    @NSManaged public var createdAt: Date?

}

extension GiphyGif : Identifiable {

}
