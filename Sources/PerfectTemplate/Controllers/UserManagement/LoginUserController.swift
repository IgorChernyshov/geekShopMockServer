//
//  LoginUserController.swift
//  PerfectTemplate
//
//  Created by Igor Chernyshov on 28/01/2019.
//

import Foundation
import PerfectHTTP

class LoginUserController {
  
  let loginUser: (HTTPRequest, HTTPResponse) -> () =  { request, response in
    
    guard let username = request.param(name:"username"),
      let password = request.param(name:"password") else {
        do {
          try response.setBody(json: ["result": 0, "userMessage": "Incorrect / missing user data. Check your request."])
          response.completed()
        } catch {
          print("Failed to create a response with an error \(error)")
        }
        return
    }
    
    do {
      try response.setBody(json: ["result": 1,
                                  "user": ["id_user": 8,
                                           "user_login": "Frostfell",
                                           "user_name": "Igor",
                                           "user_lastname": "Chernyshov"]])
      response.completed()
    } catch {
      print("Failed to create a response with an error \(error)")
    }
  }
  
}
