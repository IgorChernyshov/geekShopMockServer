//
//  RemoveReview.swift
//  PerfectTemplate
//
//  Created by Igor Chernyshov on 28/01/2019.
//

import Foundation
import PerfectHTTP

class RemoveReviewController {
  
  let removeReview: (HTTPRequest, HTTPResponse) -> () =  { request, response in
    
    guard let reviewID = request.param(name: "id_comment") else {
      do {
        try response.setBody(json: ["result": 0, "userMessage": "Incorrect / missing review ID. Check your request."])
        response.completed()
      } catch {
        print("Failed to create a response with an error \(error)")
      }
      return
    }
    
    do {
      try response.setBody(json: ["result": 1, "userMessage" : "Review #\(reviewID) has been deleted."])
      response.completed()
    } catch {
      print("Failed to create a response with an error \(error)")
    }
  }
  
}
