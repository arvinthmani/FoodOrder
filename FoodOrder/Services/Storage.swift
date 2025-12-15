//
//  Storage.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 03/06/25.
//

import Foundation
import SwiftUI

protocol StringOnly {}

extension String: StringOnly {}

class Storage<T: Codable> {
    
    let defaults = UserDefaults.standard
    
    var storageData: Data = Data()
    
    func addData(forKey key: String, data: T) {
        do {
            let d = try JSONEncoder().encode(data)
        }
        catch {
            print(ApiError.JsonEncoderError)
        }
    }
    
    func getData(forKey key: String) -> T? {
        do {
            let data = try JSONDecoder().decode(T.self, from: storageData)
            defaults.data(forKey: key)
            return data
        }
        catch {
            print(ApiError.JsonDecoderError)
            return nil
        }
    }
    
}
