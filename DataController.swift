//
//  DataController.swift
//  UIKitSwiftDataExample
//
//  Created by Minyoung Yoo on 5/24/24.
//

import Foundation
import SwiftData

class DBController {
    //set type of datamodel here...
    typealias DataModelType = MockData
    
    static var shared = DBController()
    var container: ModelContainer?
    var context: ModelContext?
    
    init() {
        do {
            self.container = try ModelContainer(for: DataModelType.self)
            if let container = self.container {
                self.context = ModelContext(container)
            }
        } catch {
            print(error)
        }
    }
    
    //insert data
    func insertData(data: DataModelType) {
        let dataToBeInserted = data
        if let context = self.context {
            context.insert(dataToBeInserted)
        }
    }
    
    //fetch data
    func fetchData(completion: @escaping ([DataModelType]?, Error?) -> ()) {
        let descriptor = FetchDescriptor<DataModelType>(sortBy: [SortDescriptor<DataModelType>(\.id)])
        if let context = self.context {
            do {
                let data = try context.fetch(descriptor)
                completion(data, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    
    //update data
    func updateData(model: DataModelType, data: DataModelType) {
        //replace updating logic here...
        let dataToBeUpdated = model
        dataToBeUpdated.title = data.title
        dataToBeUpdated.body = data.body
    }
    
    //delete data
    func deleteData(model: DataModelType) {
        let dataToBeDeleted = model
        if let context = self.context {
            context.delete(dataToBeDeleted)
        }
    }
}
