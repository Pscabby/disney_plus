//
//  CreatUser.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import Foundation
struct CreatUser:Encodable{
    let user:Users
}

struct Users:Encodable{
    let login:String
    let email:String
    let password:String
}

struct catcherror:Decodable{
    //success
    let login:String?
    //return error
    let error_code:Int?
    let message:String?
    
}


