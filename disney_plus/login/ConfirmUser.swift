//
//  ConfirmUser.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import Foundation
struct ConfirmUser:Encodable{
    let user:confirm
}

struct confirm:Encodable{
    let login:String
    let password:String
}

struct catcherror2:Decodable{
    let login:String?
    let error_code:Int?
    let message:String?
}
