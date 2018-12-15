//
//  Json.swift
//  Redddd
//
//  Created by Badi Parvaneh on 12/15/18.
//  Copyright © 2018 Badi Parvaneh. All rights reserved.
//

import Foundation

struct Json: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let children: [Child]
}

struct Child: Codable {
    let data: ChildData
}

struct ChildData: Codable {
    let selftext, authorFullname: String
    let title: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case selftext
        case title
        case authorFullname = "author_fullname"
        case author
    }
}
