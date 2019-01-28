//
//  AddReviewController.swift
//  PerfectTemplate
//
//  Created by Igor Chernyshov on 28/01/2019.
//

import Foundation
import PerfectHTTP

class AddReviewController {
  
  let addReview: (HTTPRequest, HTTPResponse) -> () =  { request, response in
    
    guard let userID = request.param(name: "id_user"),
      let text = request.param(name:"text") else {
        do {
          try response.setBody(json: ["result": 0, "errorMessage": "Incorrect / missing data. Check your request."])
          response.completed()
        } catch {
          print("Failed to create a response with an error \(error)")
        }
        return
    }
    
    do {
      try response.setBody(json: ["result": 1, "userMessage" : "Your review was sent to moderators."])
      response.completed()
    } catch {
      print("Failed to create a response with an error \(error)")
    }
  }
  
}
