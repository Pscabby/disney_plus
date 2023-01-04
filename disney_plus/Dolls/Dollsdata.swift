//
//  Dollsdata.swift
//  disney_plus
//
//  Created by Abby on 2022/12/17.
//

import Foundation

struct Dollsdata:Codable{
    let records:[Record]
    
    struct Record:Codable{
        let id:String
        let fields:Fields
    }

    struct Fields:Codable{
        let name:String
        let size:Double
        let price:Double
        let picture:[Images]
        let type:[String]
        let star:Int
    }

    struct Images:Codable{
        let url:URL
    }

}
