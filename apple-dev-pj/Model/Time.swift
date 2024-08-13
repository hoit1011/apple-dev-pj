//
//  Time.swift
//  apple-dev-pj
//
//  Created by FND_02 on 8/14/24.
//

import Foundation

struct Time {
    var minutes: Int
    var seconds: Int
    
    var convertedSeconds: Int {
        return (minutes * 60) + seconds
    }
}
