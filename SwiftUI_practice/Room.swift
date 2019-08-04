//
//  Room.swift
//  SwiftUI_practice
//
//  Created by 蔡佳宣 on 2019/7/15.
//  Copyright © 2019 蔡佳宣. All rights reserved.
//

import SwiftUI

struct Room {
    var id = UUID()
    var name: String
    var capacity: Int
    var hasVideo: Bool = false
    
    
    var imageName: String { return name }
    var thumbnailName: String { return name + "Thumb"}
}

#if DEBUG
let testData = [
    Room(name: "Observation Desk", capacity: 6, hasVideo: true)
    
]

#endif
