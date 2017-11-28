//
//  ATMNetworking.swift
//  EngageTestApp
//
//  Created by Jeff Cedilla on 11/27/17.
//  Copyright © 2017 EngageFT. All rights reserved.
//

protocol ATMNetworkingDelegate {
    func didReceiveATMs(atms: [ATM])
}

import Foundation
import UIKit

class ATMNetworking {
    
    var networkingDelegate: ATMNetworkingDelegate?
    
    let session = URLSession.shared
    
    let headerKey = "Authorization"
    
    let headerValue = "Bearer 870934df01359bfc66a5006c2d0e00d0"
    
    let endpoint = "https://api.ocbc.com:8243/atm_locator/1.1"
    
    static let shared = ATMNetworking()

    
}

// MARK: - Network Operations
extension ATMNetworking {
    
    public func callEndpoint() {
        
        guard let url = URL(string: endpoint) else {
            print("URL error")
            return
            
        }
        
        var request = URLRequest(url: url)
        request.setValue(headerValue, forHTTPHeaderField: headerKey)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error != nil { return }
            
            guard let resp = response as? HTTPURLResponse else { return }
            
            // Check that request is good
            if resp.statusCode == 200 {
                
                guard let unwrapped = data else {
                    print("Error getting JSON data")
                    return
                }
                
                let atms = self.serializeJSON(data: unwrapped)
                self.networkingDelegate?.didReceiveATMs(atms: atms)
                
                
            }
            else {
                print("Error accessing endpoint: \(resp.statusCode)")
                return
            }
            
        }
        task.resume()
    }
    
}

// MARK: - JSON
extension ATMNetworking {
    
    private func serializeJSON(data: Data) -> [ATM] {
        
        let atms = [ATM]()
        
        let decoder = JSONDecoder()
        
        do {
            let atmList = try decoder.decode(ATMList.self, from: data)
            return atmList.atmList
            
        }
        catch {
            print("error converting to JSON \(error)")
        }
        
        
        return atms
        
    }
    
    public func encodeTest() {
        let atm1 = ATM(address: "add", landmark: "land", latitude: 2, longitude: 1, postalCode: "123")
        let atmList = ATMList(atmList: [atm1])
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(atmList)
            guard let jsonString = String(data: jsonData, encoding: .utf8) else { return }
            print(jsonString)
            
        }
        catch {
            print(error)
        }
        
        
        
    }
    
}
