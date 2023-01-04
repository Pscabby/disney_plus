//
//  Songdata.swift
//  disney_plus
//
//  Created by Abby on 2022/12/11.
//

import Foundation

struct Songdata:Codable{
    let results:[more]
}

struct more:Codable{
    let artistId:Int?
    let collectionId:Int?
    let trackId:Int
    let artistName:String
    let collectionName:String
    let trackName:String
    let collectionCensoredName:String?
    let collectionArtistId:Int?
    let collectionArtistName:String?
    let artistViewUrl:URL?                //artist封面
    let collectionViewUrl:URL?            //專輯封面
    let trackViewUrl:URL                 //the same
    let previewUrl:URL                  //song url
    let artworkUrl60:URL                 //pic url
    //let releaseDate:Date
}


