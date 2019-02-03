//
//  GetUsersBasketController.swift
//  COpenSSL
//
//  Created by Igor Chernyshov on 03/02/2019.
//

import Foundation
import PerfectHTTP

class GetUsersBasketController {
  
  let getUsersBasket: (HTTPRequest, HTTPResponse) -> () =  { request, response in
    
    guard let userID = request.param(name: "id_user") else {
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
        ["productID": 1, "productName": "Laptop", "price": 78600, "quantity": 1],
        ["productID": 1, "productName": "Desktop", "price": 54200, "quantity": 1]
      ]
      
      try response.setBody(json: ["result": 1, "sumTotal": 132800, "itemsCount": 2, "products": products])
      response.completed()
    } catch {
      print("Failed to create a response with an error \(error)")
    }
  }
  
}
