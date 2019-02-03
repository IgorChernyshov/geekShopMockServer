//
//  GetItemsListController.swift
//  COpenSSL
//
//  Created by Igor Chernyshov on 03/02/2019.
//

import Foundation
import PerfectHTTP

class GetItemsListController {
  
  let getItemsList: (HTTPRequest, HTTPResponse) -> () =  { request, response in
    
    guard let pageNumber = request.param(name: "page_number"),
      let categoryID = request.param(name: "id_category") else {
        do {
          try response.setBody(json: ["result": 0, "userMessage": "Incorrect / missing data. Check your request."])
          response.completed()
        } catch {
          print("Failed to create a response with an error \(error)")
        }
        return
    }
    
    do {
      let products = [
        ["productID": 1, "productName": "Laptop", "price": 78600],
        ["productID": 1, "productName": "Desktop", "price": 54200]
      ]
      
      try response.setBody(json: ["result": 1, "pageNumber": 1, "products": products])
      response.completed()
    } catch {
      print("Failed to create a response with an error \(error)")
    }
  }
  
}
