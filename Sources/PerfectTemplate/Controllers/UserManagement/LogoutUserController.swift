//
//  Logout.swift
//  PerfectTemplate
//
//  Created by Igor Chernyshov on 28/01/2019.
//

import Foundation
import PerfectHTTP

class LogoutUserController {
  
  let logoutUser: (HTTPRequest, HTTPResponse) -> () =  { request, response in
    
    guard let userID = request.param(name:"id_user") else {
        do {
          try response.setBody(json: ["result": 0, "userMessage": "Incorrect user ID or user is not logged in."])
          response.completed()
        } catch {
          print("Failed to create a response with an error \(error)")
        }
        return
    }
    
    do {
      try response.setBody(json: ["result": 1])
      response.completed()
    } catch {
      print("Failed to create a response with an error \(error)")
    }
  }
  
}
