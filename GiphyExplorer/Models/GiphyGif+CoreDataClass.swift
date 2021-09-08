//
//  GiphyGif+CoreDataClass.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-07.
//
//

import Foundation
import CoreData

@objc(GiphyGif)
public class GiphyGif: NSManagedObject, Decodable {
    
    required public convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else { fatalError("NSManagedObjectContext is missing") }
        self.init(context: context)
        let rawGiphyGif = try RawGiphyGif(from: decoder)
        largeUrl = rawGiphyGif.data.images.downsized_large.url
    }
    
    override public func awakeFromInsert() {
        createdAt = Date.init()
    }
}


fileprivate struct RawGiphyGif: Decodable {
    var data: RawData
    
    struct RawData: Decodable {
        var images: RawImages
    }
    
    struct RawImages: Decodable {
        var downsized_large: RawDownsizedLarge
    }
    
    struct RawDownsizedLarge: Decodable {
        var url: String
    }
}

