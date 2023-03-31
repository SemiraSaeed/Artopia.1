//
//  PhotoModel.swift
//  Artopia
//
//  Created by Samira Omer on 10/03/2023.
//

import Foundation
import UIKit

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    let image: UIImage
    let description: String
}

