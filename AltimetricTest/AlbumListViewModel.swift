//
//  AlbumListViewModel.swift
//  AltimetricTest
//
//  Created by Sagar Shinde on 23/08/20.
//  Copyright © 2020 Sagar Shinde. All rights reserved.
//

import Foundation

enum SortOption {
    case release
    case trackName
    case collectioName
    case artistName
    case collectionPrice
}
class AlbumListViewModel {
    var albums:[Result.Album] = []
    var reqhandler:NetworkRequestHandler
    init(handler:NetworkRequestHandler) {
        reqhandler = handler
    }
    func fetcAlbums(completion:@escaping(Bool)->()) {
        reqhandler.getAlbums { (error, list) in
            if list != nil {
                print("all count :\(list!.count)")
                let uniqueAlbums = self.getUniqueTracks(albums: list!)
                self.albums = uniqueAlbums
                self.sortBy(option: .release)
                print("unique count :\(self.albums.count)")
                completion(true)
            }
            else {
                completion(false)
            }
        }
    }
    
    func getUniqueTracks(albums:[Result.Album]) -> [Result.Album]{
        var dictionary:[String:Result.Album] = [:]
        for song in albums {
            if let name = song.trackName {
                if dictionary[name] == nil {
                    dictionary[name] = song
                }
            }
        }
        return Array(dictionary.values)// as [Result.Album]
    }
    
    
    func sortBy(option:SortOption = .release) {
        switch option {
        case .artistName:
            self.albums = albums.sorted { (song1, song2) -> Bool in
                if song2.artistName ?? "" > song1.artistName ?? "" {
                    return true
                }
                return false
            }

        case .collectioName:
            self.albums = albums.sorted { (song1, song2) -> Bool in
                if song2.collectionName ?? "" > song1.collectionName ?? "" {
                    return true
                }
                return false
            }
        case .collectionPrice:
            break
        case .trackName:
            self.albums = albums.sorted { (song1, song2) -> Bool in
                if song2.trackName ?? "" > song1.trackName ?? "" {
                    return true
                }
                return false
            }
        case .release:
            self.albums = albums.sorted { (song1, song2) -> Bool in
                if song2.getReleaseDate() <= song1.getReleaseDate() {
                    return true
                }
                return false
            }
        }
    }
    
}
