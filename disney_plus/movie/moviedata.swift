//
//  moviedata.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import Foundation
struct moviedata:Identifiable{
    let id=UUID()
    let pic:String
    let name:String
}

extension moviedata{
    static var demomovie=moviedata(pic: "ally", name: "The Little Mermaid")
    static var demo2=moviedata(pic: "elsa", name: "Forzen")
    static var belle=moviedata(pic: "belle", name: "Beaty And The Beast")
    static var coco=moviedata(pic: "coco", name: "Coco")
    static var lion=moviedata(pic: "lion", name: "The Lion King")
}
