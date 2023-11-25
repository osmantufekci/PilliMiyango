//
//  BaseResult.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 14.11.2023.
//

import Foundation

struct BaseResult<T: Decodable>: Decodable {
    let result: T
    let success: Bool
}
