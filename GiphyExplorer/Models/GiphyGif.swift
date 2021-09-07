//
//  GiphyGif.swift
//  GiphyExplorer
//
//  Created by Michelle Ellis on 2021-09-06.
//

import Foundation

// TODO vaguely related, can I get some simplified networking library code?

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

struct GiphyGif: Decodable {
    
    var largeUrl: String

    init(from decoder: Decoder) throws {
        let rawGiphyGif = try RawGiphyGif(from: decoder)
        
        largeUrl = rawGiphyGif.data.images.downsized_large.url
    }
}

// *** The Apple documentation way ***

//struct GiphyGif {
//
//    var largeUrl: String
//
//    enum RootKeys: String, CodingKey {
//        case data
//    }
//
//    enum DataKeys: String, CodingKey {
//        case images
//    }
//
//    enum ImagesKeys: String, CodingKey {
//        case downsizedLarge = "downsized_large"
//    }
//
//    enum DownsizedLargeKeys: String, CodingKey {
//        case largeUrl = "url"
//    }
//}
//
////struct GiphyData: Codable {
////    var type: String
////}
//
//extension GiphyGif: Decodable {
//    init(from decoder: Decoder) throws {
//        let root = try decoder.container(keyedBy: RootKeys.self)
//        let data = try root.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
//        let images = try data.nestedContainer(keyedBy: ImagesKeys.self, forKey: .images)
//        let downsizedLarge = try images.nestedContainer(keyedBy: DownsizedLargeKeys.self, forKey: .downsizedLarge)
//        largeUrl = try downsizedLarge.decode(String.self, forKey: .largeUrl)
//    }
//}
