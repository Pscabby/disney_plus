//
//  OrderData.swift
//  disney_plus
//
//  Created by Abby on 2023/1/4.
//

import Foundation
struct OrderData:Codable{
    let records:[Record]
    
    struct Record:Codable{
        let id:String
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
