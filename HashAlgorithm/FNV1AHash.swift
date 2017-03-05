//
//  FNV1AHash.swift
//  HashAlgorithm
//
//  Created by Takehito Koshimizu on 2017/03/05.
//  Copyright © 2017年 Takehito Koshimizu. All rights reserved.
//

import Foundation

public struct FNV1AHash: HashAlgorithm {

    private var hash: UInt64 = 0xcbf29ce484222325
    private let prime: UInt64 = 0x100000001b3

    public init() {}

    public mutating func consume<S: Sequence>(bytes: S) where S.Iterator.Element == UInt8 {
        for byte in bytes {
            hash = (hash ^ UInt64(byte)) &* prime
        }
    }

    public var finalValue: Int {
        return Int(truncatingBitPattern: hash)
    }
}
