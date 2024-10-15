//
//  Service.swift
//  CurrencyQuotationApp
//
//  Created by Espezzialy Souza on 10/10/24.
//

import Foundation

class Service {
    
    private let baseUrl: String = "https://economia.awesomeapi.com.br/json/last"
    private let url: String = "USD-BRL,EUR-BRL,ARS-BRL"
    private let session = URLSession.shared
    
    
    func fetchData(_ completion: @escaping (CurrencyResponse?) -> Void){
        let urlString = "\(baseUrl)/\(url)"
        
        guard let url = URL(string: urlString) else { return }
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data else {
                completion(nil)
                return
            }
            
            do {
                let currencyResponse = try JSONDecoder().decode(CurrencyResponse.self, from: data)
                completion(currencyResponse)
            } catch {
                print(String(data: data, encoding: .utf8) ?? "")
                completion(nil)
            }
            
        }
        task.resume()

    }
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currencyResponse = try? JSONDecoder().decode(CurrencyResponse.self, from: jsonData)


// MARK: - CurrencyResponseValue
struct CurrencyResponseValue: Codable {
    let code, codein, name, high: String
    let low, varBid, pctChange, bid: String
    let ask, timestamp, createDate: String

    enum CodingKeys: String, CodingKey {
        case code, codein, name, high, low, varBid, pctChange, bid, ask, timestamp
        case createDate = "create_date"
    }
}

typealias CurrencyResponse = [String: CurrencyResponseValue]


