//
//  buydata.swift
//  disney_plus
//
//  Created by Abby on 2022/12/21.
//

import Foundation
struct buydata:Codable{
    let records:[Record]
    
    struct Record:Codable{
        let fields:Fields
    }

    struct Fields:Codable{
        let name:String
        let price:Double
        let picture:[Images]
        let amount:Int
        let buyer:String
        let phone:String
    }

    struct Images:Codable{
        let url:URL
    }
}
