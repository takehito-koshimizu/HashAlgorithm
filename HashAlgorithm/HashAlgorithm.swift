//
//  HashAlgorithm.swift
//  HashAlgorithm
//
//  Created by Takehito Koshimizu on 2017/03/05.
//  Copyright © 2017年 Takehito Koshimizu. All rights reserved.
//

import Foundation

public protocol HashAlgorithm {
    init()
    mutating func consume<S: Sequence>(bytes: S) where S.Iterator.Element == UInt8
    var finalValue: Int { get }
}

extension HashAlgorithm {

    public mutating func consume<I>(_ value: I) {
        var temp = value
        withUnsafeBytes(of: &temp) { rawPtr in consume(bytes: rawPtr) }
    }
}
