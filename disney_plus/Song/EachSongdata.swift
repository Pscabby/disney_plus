//
//  EachSongdata.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import Foundation

struct EachSongdata:Identifiable{
    let id=UUID()
    let name:String
    let url:String
}

extension EachSongdata{
    static var meriand=EachSongdata(name: "The Little Meriand", url: "https://itunes.apple.com/search?term=The Little Mermaid&media=music")
    static var elsa=EachSongdata(name: "Forzen", url: "https://itunes.apple.com/search?term=Frozen (Original Motion Picture Soundtrack) [Deluxe Edition]&media=music")
    static var belle=EachSongdata(name: "Beaty And The Beast", url: "https://itunes.apple.com/search?term=beauty-and-the-beast&media=music")
    static var coco=EachSongdata(name: "Coco", url: "https://itunes.apple.com/search?term=Coco (Original Motion Picture Soundtrack) [Deluxe Edition]&media=music")
    static var lion=EachSongdata(name: "The Lion King", url: "https://itunes.apple.com/search?term=The Lion King (Original Motion Picture Soundtrack)&media=music")
}
