//
//  DataModel.swift
//  UIKitSwiftDataExample
//
//  Created by Minyoung Yoo on 5/24/24.
//

import Foundation
import SwiftData

@Model
class MockData {
    @Attribute(.unique) var id: UUID
    var title: String
    var body: String
    var createDate: Date
    
    init(title: String, body: String) {
        self.id = UUID()
        self.title = title
        self.body = body
        self.createDate = Date()
    }
}
