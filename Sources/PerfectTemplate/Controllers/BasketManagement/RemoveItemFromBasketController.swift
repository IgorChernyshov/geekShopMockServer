//
//  RemoveItemFromBasketController.swift
//  COpenSSL
//
//  Created by Igor Chernyshov on 03/02/2019.
//

import Foundation
import PerfectHTTP

class RemoveItemFromBasketController {
  
  let removeItemFromBasket: (HTTPRequest, HTTPResponse) -> () =  { request, response in
    
    guard let productID = request.param(name: "id_product") else {
        do {
          try response.setBody(json: ["result": 0, "userMessage": "Incorrect / missing data. Check your request."])
          response.completed()
        } catch {
          print("Failed to create a response with an error \(error)")
        }
        return
    }
    
    do {
      try response.setBody(json: ["result": 1, "userMessage" : "Successfully removed item(s)"])
      response.completed()
    } catch {
      print("Failed to create a response with an error \(error)")
    }
  }
  
}
