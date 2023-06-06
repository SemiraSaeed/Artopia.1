//
//  PhotoModel.swift
//  Artopia
//
//  Created by Samira Omer on 10/03/2023.
//

import Foundation


struct ItemModel: Identifiable {
    let id = UUID()
    let title: String
    let artistName: String
    let image: String
  
    let description: String
}

