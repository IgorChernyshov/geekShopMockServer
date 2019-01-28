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
    guard let receivedString = request.postBodyString,
      let data = receivedString.data(using: .utf8) else {
        response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong / missing user data. Check your request."))
        return
    }
    
    do {
      let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
      let userToRegister = RegisterUserRequest(json)
      
      try response.setBody(json: ["result": 1, "userMessage": "\(userToRegister.username) has been successfully registered!"])
      response.completed()
    } catch {
      response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
    }
  }
}
