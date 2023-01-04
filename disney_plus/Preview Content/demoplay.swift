//
//  demoplay.swift
//  disney_plus
//
//  Created by Abby on 2022/12/16.
//

import Foundation
import UIKit

extension  more{
    static var preview: Self{
        let data = NSDataAsset(name: "DemoPlay")!.data
        let decoder = JSONDecoder()
        let song = try! decoder.decode(Songdata.self, from: data)
        return song.results[0]
    }
}

extension Dollsdata.Record{
    static var DollsPreview: Self{
        let data = NSDataAsset(name: "buy")!.data
        let decoder = JSONDecoder()
        let dolls = try! decoder.decode(Dollsdata.self, from: data)
        return dolls.records[0]
    }
}
