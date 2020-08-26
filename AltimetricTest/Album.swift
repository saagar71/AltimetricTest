//
//  Album.swift
//  AltimetricTest
//
//  Created by Sagar Shinde on 23/08/20.
//  Copyright © 2020 Sagar Shinde. All rights reserved.
//

import Foundation

class Result: Decodable {
    var resultCount:Int
    var results:[Album]
    
    class Album: Decodable {
        var wrapperType:String
        var kind: String
        var artistId:Int?//: 348580754,
        var collectionId:Int?//": 929825574,
        var trackId:Int?// 929825615,
        var artistName:String?// "Meghan Trainor",
        var collectionName:String?// "Title (Deluxe Edition)",
        var trackName:String? //"All About That Bass",
        var collectionCensoredName:String?// "Title (Deluxe Edition)",
        var trackCensoredName:String?// "All About That Bass",
        var artistViewUrl:String?// "https://music.apple.com/us/artist/meghan-trainor/348580754?uo=4",
        var collectionViewUrl:String?// "https://music.apple.com/us/album/all-about-that-bass/929825574?i=929825615&uo=4",
        var trackViewUrl:String? //"https://music.apple.com/us/album/all-about-that-bass/929825574?i=929825615&uo=4",
        var previewUrl:String? //": "https://audio-ssl.itunes.apple.com/itunes-assets/Music1/v4/c5/3c/5d/c53c5d1b-9ec3-95c7-df1f-44a4fe7ed52d/mzaf_8689431380311485251.plus.aac.p.m4a",
        var artworkUrl30:String?//": "https://is2-ssl.mzstatic.com/image/thumb/Music5/v4/41/7d/a2/417da2f7-b676-4dcb-8f41-8278a2501bf4/source/30x30bb.jpg",
        var artworkUrl60:String? //": "https://is2-ssl.mzstatic.com/image/thumb/Music5/v4/41/7d/a2/417da2f7-b676-4dcb-8f41-8278a2501bf4/source/60x60bb.jpg",
        var artworkUrl100:String? //": "https://is2-ssl.mzstatic.com/image/thumb/Music5/v4/41/7d/a2/417da2f7-b676-4dcb-8f41-8278a2501bf4/source/100x100bb.jpg",
        var collectionPrice:Double? //": 12.99,
        var trackPrice:Double? //": 1.29,
        var releaseDate:String //": "2014-06-30T07:00:00Z",
        var collectionExplicitness:String? //: "explicit",
        var trackExplicitness:String? //": "explicit",
        var discCount:Int? //": 1,
        var discNumber:Int? //": 1,
        var trackCount:Int? //": 15,
        var trackNumber:Int? //": 2,
        var trackTimeMillis:Int? //": 191489,
        var country:String? //": "USA",
        var currency:String? //": "USD",
        var primaryGenreName:String? //": "Pop",
        var contentAdvisoryRating:String? //": "Explicit",
        var isStreamable:Bool? //": true
    }
}


extension Result.Album {
    func getReleaseDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM, yyyy"// yyyy-MM-dd"
        return dateFormatter.date(from: self.releaseDate) ?? Date()
    }
}
