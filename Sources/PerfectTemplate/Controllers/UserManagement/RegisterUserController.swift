//
//  RegisterUserController.swift
//  PerfectTemplate
//
//  Created by Igor Chernyshov on 28/01/2019.
//

import Foundation
import PerfectHTTP

class RegisterUserController {
  
  let registerUser: (HTTPRequest, HTTPResponse) -> () =  { request, response in
    
    guard let userID = request.param(name: "id_user"),
      let username = request.param(name:"username"),
      let password = request.param(name:"password"),
      let email = request.param(name:"email") else {
        do {
          try response.setBody(json: ["result": 0, "userMessage": "Incorrect / missing user data. Check your request."])
          response.completed()
        } catch {
          print("Failed to create a response with an error \(error)")
        }
        return
    }
    
    do {
      try response.setBody(json: ["result": 1, "userMessage": "User \(username) has been successfully registered!"])
      response.completed()
    } catch {
      print("Failed to create a response with an error \(error)")
    }
  }
  
}
